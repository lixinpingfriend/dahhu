HuziConfig = {}
HuziConfig.MAX_QI_COUNT = 26           --最大出牌(弃张)数量
HuziConfig.MAX_TING_COUNT = 22
HuziConfig.MAX_XIA_COUNT = 13
HuziConfig.MAX_OPERA_COUNT = 7          --操作牌最多杠7张


HuziAction = 
{
	Chi                 = 1,      	--吃											_4吃(大冶)
	Peng            	= 2,        --碰											_4碰(大冶)
	WeiOrSao            = 3,        --偎			_2啸			_3扫
	KaiZhao             = 4,        --开招			 	         	_3跑  			_4开朝(大冶)
	Ti                  = 5,        --提			_2倾			_3开招			_4天拢(大冶)	_5扫穿
	Hu 					= 6,        --胡			_4胡(大冶)
	Qi 					= 7,        --弃牌
	Chu 				= 8,        --出
	FanJiang 			= 9,        --翻将
	KaiZhaoChongZhao	= 10,       --开招重招
	GuoSao 				= 11,       --臭偎			_2过扫			_3臭啸			
	SaoChuang 			= 12,       --扫穿
	DangDi 				= 13,       --档底
    SaoChuangChongZhao 	= 14,    	--扫穿重招
	ChongZhao 			= 15,       --重招
	ChuZhangShouHui 	= 16,       --出张收回
	KaiJu 				= 17,       --开局
	TiKaiju 			= 18,       --提(开局)		_1提			
	ChongTi 			= 19,       --重提
	Guo 				= 20,       --过(回放用)
	WangDiao 			= 21,       --王钓
	WangChuang 			= 22,       --王闯		
	WangZha 			= 23,       --王炸
	QiHu 				= 24,       --弃胡			_1亡手
	BiPai 				= 25,		--比牌			_1吃  			_2下火
	MoPai 				= 26,		--摸牌		
	PingHu 				= 31,		--平胡											_4胡(大冶)
	ZiMo 				= 32,		--自摸											_4接炮(大冶)
	TianHu 				= 33,		--天胡											_4天胡(大冶)
	DiHu 				= 34,		--地胡											_4地胡(大冶)
	SanLongWuKan 		= 35,		--三笼五坎
	JiePao 				= 36,		--接炮											_4接炮(大冶)
	DianPao 			= 37,		--点炮											_4点炮(大冶)

}