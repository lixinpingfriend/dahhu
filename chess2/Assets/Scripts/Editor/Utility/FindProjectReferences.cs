
using UnityEngine;
using UnityEditor.Animations;
using System.Collections;
using UnityEditor;
using System.Collections.Generic;
using UnityEngine.UI;
using System.IO;

public class FindProject {
	
	#if UNITY_EDITOR_OSX
	
	[MenuItem("Assets/Find References In Project", false, 2000)]
	private static void FindProjectReferences()
	{
		string appDataPath = Application.dataPath;
		string output = "";
		string selectedAssetPath = AssetDatabase.GetAssetPath (Selection.activeObject);
		List<string> references = new List<string>();
		
		string guid = AssetDatabase.AssetPathToGUID (selectedAssetPath);
		
		var psi = new System.Diagnostics.ProcessStartInfo();
		psi.WindowStyle = System.Diagnostics.ProcessWindowStyle.Maximized;
		psi.FileName = "/usr/bin/mdfind";
		psi.Arguments = "-onlyin " + Application.dataPath + " " + guid;
		psi.UseShellExecute = false;
		psi.RedirectStandardOutput = true;
		psi.RedirectStandardError = true;
		
		System.Diagnostics.Process process = new System.Diagnostics.Process();
		process.StartInfo = psi;
		
		process.OutputDataReceived += (sender, e) => {
			if(string.IsNullOrEmpty(e.Data))
				return;
			
			string relativePath = "Assets" + e.Data.Replace(appDataPath, "");
			
			// skip the meta file of whatever we have selected
			if(relativePath == selectedAssetPath + ".meta")
				return;
			
			references.Add(relativePath);
			
		};
		process.ErrorDataReceived += (sender, e) => {
			if(string.IsNullOrEmpty(e.Data))
				return;
			
			output += "Error: " + e.Data + "\n";
		};
		process.Start();
		process.BeginOutputReadLine();
		process.BeginErrorReadLine();
		
		process.WaitForExit(2000);
		
		foreach(var file in references){
			output += file + "\n";
			Debug.Log(file, AssetDatabase.LoadMainAssetAtPath(file));
		}
		
		Debug.LogWarning(references.Count + " references found for object " + Selection.activeObject.name + "\n\n" + output);
	}

		
	#endif



	[MenuItem("GameObject/Find Sprite In Other Package", false, 2000)]
	private static void FindSpriteInOtherPackage()
	{
		string curPackage = "/JiaoJiaZi/";
		string targetPackage = "/WuShiK/";
        string targetPackage_3d = targetPackage.Substring(0, targetPackage.LastIndexOf("/")) + "3D/";
        string curPackage_3d = curPackage.Substring(0, curPackage.LastIndexOf("/")) + "3D/";

		var go = Selection.activeGameObject;
		var images = go.transform.GetComponentsInChildren<Image>(true);
		for (int i = 0; i < images.Length; i++)
		{
			var sprite = images[i].sprite;
			if (sprite != null) {
				string path = AssetDatabase.GetAssetPath(sprite.texture);
				if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
				    string newPath = string.Empty;
				    if(path.Contains(targetPackage)){
                        newPath = path.Replace(targetPackage, curPackage);
				    }
				    else if(path.Contains(targetPackage_3d)){
                        newPath = path.Replace(targetPackage_3d, curPackage_3d);
				    }

					Sprite targetSprite = AssetDatabase.LoadAssetAtPath<Sprite>(newPath);
					if (targetSprite == null) {
						var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
						Directory.CreateDirectory(newDIr);
						if (AssetDatabase.CopyAsset(path, newPath)) {
							targetSprite = AssetDatabase.LoadAssetAtPath<Sprite>(newPath);

						} else {
							Debug.LogErrorFormat("{0}复制图片失败{1}", path, newPath);
						}
					}

					if (targetSprite != null) {
						images[i].sprite = targetSprite;
					} else {
						Debug.LogError("LoadAssetAtPath的Sprite为null" + newPath);
					}
				}
			}

			var mat = images[i].material;
			if (mat != null) {
				string path = AssetDatabase.GetAssetPath(mat);
				if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
				    string newPath = string.Empty;
				    if(path.Contains(targetPackage)){
                        newPath = path.Replace(targetPackage, curPackage);
				    }
				    else if(path.Contains(targetPackage_3d)){
                        newPath = path.Replace(targetPackage_3d, curPackage_3d);
				    }

					Material targetMat = AssetDatabase.LoadAssetAtPath<Material>(newPath);
					if (targetMat == null) {
						var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
						Directory.CreateDirectory(newDIr);
						if (AssetDatabase.CopyAsset(path, newPath)) {
							targetMat = AssetDatabase.LoadAssetAtPath<Material>(newPath);

						} else {
							Debug.LogErrorFormat("{0}复制材质球失败{1}", path, newPath);
						}
					}

					if (targetMat != null) {
						images[i].material = targetMat;
				        path = AssetDatabase.GetAssetPath(targetMat.mainTexture);
                        if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                            string tmpNewPath = string.Empty;
                            if(path.Contains(targetPackage)){
                                tmpNewPath = path.Replace(targetPackage, curPackage);
                            }
                            else if(path.Contains(targetPackage_3d)){
                                tmpNewPath = path.Replace(targetPackage_3d, curPackage_3d);
                            }

                            Texture2D targetTexture2D = AssetDatabase.LoadAssetAtPath<Texture2D>(tmpNewPath);
                            if (targetTexture2D == null) {
                                var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(tmpNewPath);
                                Directory.CreateDirectory(newDIr);
                                if (AssetDatabase.CopyAsset(path, tmpNewPath)) {
                                    targetTexture2D = AssetDatabase.LoadAssetAtPath<Texture2D>(tmpNewPath);

                                } else {
                                    Debug.LogErrorFormat("{0}复制图片失败{1}", path, tmpNewPath);
                                }
                            }

                            if (targetTexture2D != null) {
                                targetMat.mainTexture = targetTexture2D;
                            } else {
                                Debug.LogError("LoadAssetAtPath的Texture2D为null" + tmpNewPath);
                            }
                        }
					} else {
						Debug.LogError("LoadAssetAtPath的材质球为null" + newPath);
					}
				}
			}
		}

		var spriteHolders = go.transform.GetComponentsInChildren<SpriteHolder>(true);
		for (int i = 0; i < spriteHolders.Length; i++)
		{
			foreach (var item in spriteHolders[i].injections)
			{
				var sprite = item.value;
				if (sprite != null) {
					string path = AssetDatabase.GetAssetPath(sprite.texture);
                    if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                        string newPath = string.Empty;
                        if(path.Contains(targetPackage)){
                            newPath = path.Replace(targetPackage, curPackage);
                        }
                        else if(path.Contains(targetPackage_3d)){
                            newPath = path.Replace(targetPackage_3d, curPackage_3d);
                        }

						Sprite targetSprite = AssetDatabase.LoadAssetAtPath<Sprite>(newPath);
						if (targetSprite == null) {
							var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
							Directory.CreateDirectory(newDIr);
							if (AssetDatabase.CopyAsset(path, newPath)) {
								targetSprite = AssetDatabase.LoadAssetAtPath<Sprite>(newPath);

							} else {
								Debug.LogErrorFormat("{0}复制图片失败{1}", path, newPath);
							}
						}

						if (targetSprite != null) {
							item.value = targetSprite;
						} else {
							Debug.LogError("LoadAssetAtPath的Sprite为null" + newPath);
						}
					}
				}
			}

		}

		foreach (var datas in go.transform.GetComponentsInChildren<SpriteAtlas>(true))
		{
			for (int i = 0; i < datas.values.Count; i++)
			{
				var sprite = datas.values[i];
				if (sprite != null) {
					string path = AssetDatabase.GetAssetPath(sprite.texture);
                    if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                        string newPath = string.Empty;
                        if(path.Contains(targetPackage)){
                            newPath = path.Replace(targetPackage, curPackage);
                        }
                        else if(path.Contains(targetPackage_3d)){
                            newPath = path.Replace(targetPackage_3d, curPackage_3d);
                        }

						Sprite targetSprite = AssetDatabase.LoadAssetAtPath<Sprite>(newPath);
						if (targetSprite == null) {
							var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
							Directory.CreateDirectory(newDIr);
							if (AssetDatabase.CopyAsset(path, newPath)) {
								targetSprite = AssetDatabase.LoadAssetAtPath<Sprite>(newPath);

							} else {
								Debug.LogErrorFormat("{0}复制图片失败{1}", path, newPath);
							}
						}

						if (targetSprite != null) {
							datas.values[i] = targetSprite;
						} else {
							Debug.LogError("LoadAssetAtPath的Sprite为null" + newPath);
						}
					}
				}
			}
		}


		foreach (var datas in go.transform.GetComponentsInChildren<UIImageAnimation>(true))
		{
			for (int i = 0; i < datas.sprites.Count; i++)
			{
				var sprite = datas.sprites[i];
				if (sprite != null) {
					string path = AssetDatabase.GetAssetPath(sprite.texture);
                    if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                        string newPath = string.Empty;
                        if(path.Contains(targetPackage)){
                            newPath = path.Replace(targetPackage, curPackage);
                        }
                        else if(path.Contains(targetPackage_3d)){
                            newPath = path.Replace(targetPackage_3d, curPackage_3d);
                        }

						Sprite targetSprite = AssetDatabase.LoadAssetAtPath<Sprite>(newPath);
						if (targetSprite == null) {
							var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
							Directory.CreateDirectory(newDIr);
							if (AssetDatabase.CopyAsset(path, newPath)) {
								targetSprite = AssetDatabase.LoadAssetAtPath<Sprite>(newPath);

							} else {
								Debug.LogErrorFormat("{0}复制图片失败{1}", path, newPath);
							}
						}

						if (targetSprite != null) {
							datas.sprites[i] = targetSprite;
						} else {
							Debug.LogError("LoadAssetAtPath的Sprite为null" + newPath);
						}
					}
				}
			}
		}

		foreach (var datas in go.transform.GetComponentsInChildren<Animator>(true))
		{
				var sprite = datas.runtimeAnimatorController;
				if (sprite != null) {
					string path = AssetDatabase.GetAssetPath(sprite);
                    if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                        string newPath = string.Empty;
                        if(path.Contains(targetPackage)){
                            newPath = path.Replace(targetPackage, curPackage);
                        }
                        else if(path.Contains(targetPackage_3d)){
                            newPath = path.Replace(targetPackage_3d, curPackage_3d);
                        }

						AnimatorController targetSprite = AssetDatabase.LoadAssetAtPath<AnimatorController>(newPath);

						if (targetSprite == null) {
							var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
							Directory.CreateDirectory(newDIr);
							if (AssetDatabase.CopyAsset(path, newPath)) {
								targetSprite = AssetDatabase.LoadAssetAtPath<AnimatorController>(newPath);
							} else {
								Debug.LogErrorFormat("{0}复制图片失败{1}", path, newPath);
							}
						}

						if (targetSprite != null) {
							datas.runtimeAnimatorController = targetSprite;
						} else {
							Debug.LogError("LoadAssetAtPath的Sprite为null" + newPath);
						}
					}
					AnimatorController tmpController = sprite as AnimatorController;
                    foreach(var layer in tmpController.layers)
                    {
                        foreach(var state in layer.stateMachine.states)
                        {

                            string motionPath = AssetDatabase.GetAssetPath(state.state.motion);
                            if (motionPath.Contains(targetPackage) || motionPath.Contains(targetPackage_3d)) {
                                string newMotionPath = string.Empty;
                                if(motionPath.Contains(targetPackage)){
                                    newMotionPath = motionPath.Replace(targetPackage, curPackage);
                                }
                                else if(motionPath.Contains(targetPackage_3d)){
                                    newMotionPath = motionPath.Replace(targetPackage_3d, curPackage_3d);
                                }

                                AnimationClip targetMotion = AssetDatabase.LoadAssetAtPath<AnimationClip>(newMotionPath);

                                if (targetMotion == null) {
                                    var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newMotionPath);
                                    Directory.CreateDirectory(newDIr);
                                    if (AssetDatabase.CopyAsset(motionPath, newMotionPath)) {
                                        targetMotion = AssetDatabase.LoadAssetAtPath<AnimationClip>(newMotionPath);
                                        Debug.LogErrorFormat("{0}", newMotionPath);
                                    } else {
                                        Debug.LogErrorFormat("{0}复制图片失败{1}", motionPath, newMotionPath);
                                    }
                                }

                                if (targetMotion != null) {
                                    state.state.motion = targetMotion;
                                } else {
                                    Debug.LogError("LoadAssetAtPath的Sprite为null" + newMotionPath);
                                }
                            }
                        }

                    }
				}
		}

        foreach (var datas in go.transform.GetComponentsInChildren<Animation>(true))
        {
				var sprite = datas.clip;
				if (sprite != null) {
					string path = AssetDatabase.GetAssetPath(sprite);
                    if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                        string newPath = string.Empty;
                        if(path.Contains(targetPackage)){
                            newPath = path.Replace(targetPackage, curPackage);
                        }
                        else if(path.Contains(targetPackage_3d)){
                            newPath = path.Replace(targetPackage_3d, curPackage_3d);
                        }

						AnimationClip targetSprite = AssetDatabase.LoadAssetAtPath<AnimationClip>(newPath);

						if (targetSprite == null) {
							var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
							Directory.CreateDirectory(newDIr);
							if (AssetDatabase.CopyAsset(path, newPath)) {
								targetSprite = AssetDatabase.LoadAssetAtPath<AnimationClip>(newPath);
							} else {
								Debug.LogErrorFormat("{0}复制图片失败{1}", path, newPath);
							}
						}

						if (targetSprite != null) {
							datas.clip = targetSprite;
						} else {
							Debug.LogError("LoadAssetAtPath的Sprite为null" + newPath);
						}
					}
				}
        }

		foreach (var datas in go.transform.GetComponentsInChildren<Renderer>(true))
		{
            FillRendererAssets(datas, targetPackage, curPackage);
		}
		foreach (var datas in go.transform.GetComponentsInChildren<ParticleSystem>(true))
		{
		    var render = datas.GetComponent<ParticleSystemRenderer>();
		    if(render != null)
		    {
		        Debug.LogError("render != null" + render.name);
		        FillRendererAssets(render, targetPackage, curPackage);
		    }
		}

		foreach (var datas in go.transform.GetComponentsInChildren<MeshFilter>(true))
		{
            var mesh = datas.sharedMesh;
            if (mesh != null) {
                string path = AssetDatabase.GetAssetPath(mesh);
                if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                    string newPath = string.Empty;
                    if(path.Contains(targetPackage)){
                        newPath = path.Replace(targetPackage, curPackage);
                    }
                    else if(path.Contains(targetPackage_3d)){
                        newPath = path.Replace(targetPackage_3d, curPackage_3d);
                    }

                    Mesh targetMesh = AssetDatabase.LoadAssetAtPath<Mesh>(newPath);
                    if (targetMesh == null) {
                        var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
                        Directory.CreateDirectory(newDIr);
                        if (AssetDatabase.CopyAsset(path, newPath)) {
                            targetMesh = AssetDatabase.LoadAssetAtPath<Mesh>(newPath);

                        } else {
                            Debug.LogErrorFormat("{0}复制Mesh失败{1}", path, newPath);
                        }
                    }

                    if (targetMesh != null) {
                        datas.sharedMesh = targetMesh;
                    } else {
                        Debug.LogError("LoadAssetAtPath的Mesh为null" + newPath);
                    }
                }
            }
		}
		Debug.Log("处理完成");
		// foreach(var file in references){
		// 	output += file + "\n";
		// 	Debug.Log(file, AssetDatabase.LoadMainAssetAtPath(file));
		// }

		// Debug.LogWarning(references.Count + " references found for object " + Selection.activeObject.name + "\n\n" + output);
	}

    private static void FillRendererAssets(Renderer render, string targetPackage, string curPackage)
    {
        string targetPackage_3d = targetPackage.Substring(0, targetPackage.LastIndexOf("/")) + "3D/";
        string curPackage_3d = curPackage.Substring(0, curPackage.LastIndexOf("/")) + "3D/";
        var mat = render.sharedMaterial;
        if (mat != null) {
            string path = AssetDatabase.GetAssetPath(mat);
            if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                string newPath = string.Empty;
                if(path.Contains(targetPackage)){
                    newPath = path.Replace(targetPackage, curPackage);
                }
                else if(path.Contains(targetPackage_3d)){
                    newPath = path.Replace(targetPackage_3d, curPackage_3d);
                }
                Material targetMat = AssetDatabase.LoadAssetAtPath<Material>(newPath);
                if (targetMat == null) {
                    var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
                    Directory.CreateDirectory(newDIr);
                    if (AssetDatabase.CopyAsset(path, newPath)) {
                        targetMat = AssetDatabase.LoadAssetAtPath<Material>(newPath);

                    } else {
                        Debug.LogErrorFormat("{0}复制材质球失败{1}", path, newPath);
                    }
                }

                if (targetMat != null) {
                    render.sharedMaterial = targetMat;
                } else {
                    Debug.LogError("LoadAssetAtPath的材质球为null" + newPath);
                }
            }
            path = AssetDatabase.GetAssetPath(render.sharedMaterial.mainTexture);
//            Debug.LogErrorFormat("{0}", path);
            if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                string tmpNewPath = string.Empty;
                if(path.Contains(targetPackage)){
                    tmpNewPath = path.Replace(targetPackage, curPackage);
                }
                else if(path.Contains(targetPackage_3d)){
                    tmpNewPath = path.Replace(targetPackage_3d, curPackage_3d);
                }

                Texture2D targetTexture2D = AssetDatabase.LoadAssetAtPath<Texture2D>(tmpNewPath);
                if (targetTexture2D == null) {
                    var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(tmpNewPath);
                    Directory.CreateDirectory(newDIr);
                    if (AssetDatabase.CopyAsset(path, tmpNewPath)) {
                        targetTexture2D = AssetDatabase.LoadAssetAtPath<Texture2D>(tmpNewPath);

                    } else {
                        Debug.LogErrorFormat("{0}复制图片失败{1}", path, tmpNewPath);
                    }
                }

                if (targetTexture2D != null) {
                    render.sharedMaterial.mainTexture = targetTexture2D;
                } else {
                    Debug.LogError("LoadAssetAtPath的Texture2D为null" + tmpNewPath);
                }
            }
        }
        for(int i = 0;i < render.sharedMaterials.Length; i++)
        {
            mat = render.sharedMaterials[i];
            if (mat != null) {
                string path = AssetDatabase.GetAssetPath(mat);
                if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                    string newPath = string.Empty;
                    if(path.Contains(targetPackage)){
                        newPath = path.Replace(targetPackage, curPackage);
                    }
                    else if(path.Contains(targetPackage_3d)){
                        newPath = path.Replace(targetPackage_3d, curPackage_3d);
                    }

                    Material targetMat = AssetDatabase.LoadAssetAtPath<Material>(newPath);
                    if (targetMat == null) {
                        var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
                        Directory.CreateDirectory(newDIr);
                        if (AssetDatabase.CopyAsset(path, newPath)) {
                            targetMat = AssetDatabase.LoadAssetAtPath<Material>(newPath);

                        } else {
                            Debug.LogErrorFormat("{0}复制材质球失败{1}", path, newPath);
                        }
                    }

                    if (targetMat != null) {
                        render.sharedMaterials[i] = targetMat;
                    } else {
                        Debug.LogError("LoadAssetAtPath的材质球为null" + newPath);
                    }
                }
                path = AssetDatabase.GetAssetPath(render.sharedMaterials[i].mainTexture);

                if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                    string tmpNewPath = string.Empty;
                    if(path.Contains(targetPackage)){
                        tmpNewPath = path.Replace(targetPackage, curPackage);
                    }
                    else if(path.Contains(targetPackage_3d)){
                        tmpNewPath = path.Replace(targetPackage_3d, curPackage_3d);
                    }

                    Texture2D targetTexture2D = AssetDatabase.LoadAssetAtPath<Texture2D>(tmpNewPath);
                    if (targetTexture2D == null) {
                        var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(tmpNewPath);
                        Directory.CreateDirectory(newDIr);
                        if (AssetDatabase.CopyAsset(path, tmpNewPath)) {
                            targetTexture2D = AssetDatabase.LoadAssetAtPath<Texture2D>(tmpNewPath);

                        } else {
                            Debug.LogErrorFormat("{0}复制图片失败{1}", path, tmpNewPath);
                        }
                    }

                    if (targetTexture2D != null) {
                        render.sharedMaterials[i].mainTexture = targetTexture2D;
                    } else {
                        Debug.LogError("LoadAssetAtPath的Texture2D为null" + tmpNewPath);
                    }
                }
            }
        }

        var particleSystemRenderer = render as ParticleSystemRenderer;
        if(particleSystemRenderer != null)
        {
            mat = particleSystemRenderer.trailMaterial;
            if (mat != null) {
                Debug.LogError("trailMaterial != null " + mat.name);
                string path = AssetDatabase.GetAssetPath(mat);
                if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                    string newPath = string.Empty;
                    if(path.Contains(targetPackage)){
                        newPath = path.Replace(targetPackage, curPackage);
                    }
                    else if(path.Contains(targetPackage_3d)){
                        newPath = path.Replace(targetPackage_3d, curPackage_3d);
                    }

                    Material targetMat = AssetDatabase.LoadAssetAtPath<Material>(newPath);
                    if (targetMat == null) {
                        var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(newPath);
                        Directory.CreateDirectory(newDIr);
                        if (AssetDatabase.CopyAsset(path, newPath)) {
                            targetMat = AssetDatabase.LoadAssetAtPath<Material>(newPath);

                        } else {
                            Debug.LogErrorFormat("{0}复制材质球失败{1}", path, newPath);
                        }
                    }

                    if (targetMat != null) {
                        particleSystemRenderer.trailMaterial = targetMat;
                    } else {
                        Debug.LogError("LoadAssetAtPath的材质球为null" + newPath);
                    }
                }
                path = AssetDatabase.GetAssetPath(particleSystemRenderer.trailMaterial.mainTexture);
    //            Debug.LogErrorFormat("{0}", path);
                if (path.Contains(targetPackage) || path.Contains(targetPackage_3d)) {
                    string tmpNewPath = string.Empty;
                    if(path.Contains(targetPackage)){
                        tmpNewPath = path.Replace(targetPackage, curPackage);
                    }
                    else if(path.Contains(targetPackage_3d)){
                        tmpNewPath = path.Replace(targetPackage_3d, curPackage_3d);
                    }

                    Texture2D targetTexture2D = AssetDatabase.LoadAssetAtPath<Texture2D>(tmpNewPath);
                    if (targetTexture2D == null) {
                        var newDIr = Application.dataPath.Replace("Assets", "") + Path.GetDirectoryName(tmpNewPath);
                        Directory.CreateDirectory(newDIr);
                        if (AssetDatabase.CopyAsset(path, tmpNewPath)) {
                            targetTexture2D = AssetDatabase.LoadAssetAtPath<Texture2D>(tmpNewPath);

                        } else {
                            Debug.LogErrorFormat("{0}复制图片失败{1}", path, tmpNewPath);
                        }
                    }

                    if (targetTexture2D != null) {
                        particleSystemRenderer.trailMaterial.mainTexture = targetTexture2D;
                    } else {
                        Debug.LogError("LoadAssetAtPath的Texture2D为null" + tmpNewPath);
                    }
                }
            }
        }
    }


}