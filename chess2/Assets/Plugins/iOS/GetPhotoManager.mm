







#import <Foundation/Foundation.h>

#import "GetPhotoManager.h"
#include <sys/param.h>
#include <sys/mount.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>

extern "C"
{
    void _GetPhotoControl(int index);
    void _SetImageSize(int w,int h);
}

static GetPhotoManager *getPhotoControl;

void _GetPhotoControl(int index)
{
    if(getPhotoControl == NULL)
    {
        getPhotoControl = [[GetPhotoManager alloc] init];
    }
    [getPhotoControl GetPhotoChoose:index];
}

void _SetImageSize(int width,int high)
{
    if(getPhotoControl == NULL)
    {
        getPhotoControl = [[GetPhotoManager alloc] init];
    }
    [getPhotoControl SetImageSize:width andHigh:high];
}


@implementation GetPhotoManager
typedef enum {
    kCLAuthorizationStatusNotDetermined = 0, // 用户尚未做出选择这个应用程序的问候
    kCLAuthorizationStatusRestricted,        // 此应用程序没有被授权访问的照片数据。可能是家长控制权限
    kCLAuthorizationStatusDenied,            // 用户已经明确否认了这一照片数据的应用程序访问
    kCLAuthorizationStatusAuthorized         // 用户已经授权应用访问照片数据} CLAuthorizationStatus;
};

- (void)SetImageSize:(NSInteger)width andHigh:(NSInteger)high{
    _width = width;
    _high = high;
}

- (void)GetPhotoChoose:(NSInteger)ChooseIndex{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        switch (ChooseIndex) {
            case 0:
                //来源:相机
                if([self GetCameraPermission] == -1)
                {
					UnitySendMessage("GameSDKCallback", "OnCancelPhotoCallback", "");
                    return;
                }
                sourceType = UIImagePickerControllerSourceTypeCamera;
                break;
            case 1:
                if([self GEtPickPermission] == -1)
                {
					UnitySendMessage("GameSDKCallback", "OnCancelPhotoCallback", "");
                    return;
                }
                //来源:相册
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                break;
            case 2:
				UnitySendMessage("GameSDKCallback", "OnCancelPhotoCallback", "");
                return;
        }
    }
    else
    {
        if (ChooseIndex == 2) {
			UnitySendMessage("GameSDKCallback", "OnCancelPhotoCallback", "");
            return;
        }
        else
        {
            if([self GEtPickPermission] == -1)
            {
				UnitySendMessage("GameSDKCallback", "OnCancelPhotoCallback", "");
                return;
            }
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
    }
    // 跳转到相机或相册页面
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    //imagePickerController.allowsEditing = NO;
    imagePickerController.sourceType = sourceType;
    
    [UnityGetGLViewController() presentViewController:imagePickerController animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSString *stringPhoto;
    if(_width==0 || _high==0)
    {
        NSData *fData = UIImageJPEGRepresentation(image, 1);
        CGSize imageSize = image.size;
        stringPhoto = [fData base64EncodedStringWithOptions:0];
        NSString *str = [NSString stringWithFormat:@"%d|%d",(int)imageSize.width,(int)imageSize.height];
        UnitySendMessage("GameSDKCallback", "OnSendImageSizeCallback",[str UTF8String]);
    }
    else
    {
        NSData *fData = [self imageCompressForWidth:image targetWidth:_width targetHeight:_high];
        stringPhoto = [fData base64EncodedStringWithOptions:0];
    }
    UnitySendMessage("GameSDKCallback", "OnShowPhotoCallback", [stringPhoto UTF8String]);
    //NSData *fDataSmall = [self imageCompressForWidth:image targetWidth:80 targetHeight:60];
    //NSString *stringPhotoSmall = [fDataSmall base64EncodedStringWithOptions:0];
    //UnitySendMessage("GameMain", "ShowMiniPhoto", [stringPhotoSmall UTF8String]);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
	UnitySendMessage("GameSDKCallback", "OnCancelPhotoCallback", "");
}

- (NSData *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth targetHeight:(CGFloat)defineHeight
{
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = (targetWidth / width) * height;
    if(targetHeight > defineHeight)
    {
        targetHeight = defineHeight;
        targetWidth = (targetHeight / height) * width;
    }
    //NSLog(@"image w:%f h:%f  now w:%f h:%f",width,height,targetHeight,targetWidth);
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth,  targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *fData = UIImageJPEGRepresentation(newImage, 1);
    NSString *str = [NSString stringWithFormat:@"%d|%d",(int)targetWidth,(int)targetHeight];
    UnitySendMessage("GameSDKCallback", "OnSendImageSizeCallback",[str UTF8String]);
    return fData;
}

-(int) GetCameraPermission
{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];

    if(authStatus == AVAuthorizationStatusRestricted|| authStatus == AVAuthorizationStatusDenied){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请在设备的设置-隐私-相机中允许访问相机。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return -1;
    }
    else if(authStatus == AVAuthorizationStatusAuthorized){//允许访问
        return 0;
        
    }
    return 0;
}

-(int) GEtPickPermission
{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == kCLAuthorizationStatusRestricted || author == kCLAuthorizationStatusDenied){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请在设备的设置-隐私-照片中允许访问照片。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return -1;
    }
    return 0;
}

@end
