var maxTips = 18;
var tips;
var pos = 0;

tips[pos] = "勇猛的英雄是不会向后转的，遇见障碍物时向左或向右移动吧"; pos++;
tips[pos] = "出阵前购买各种【神 器】吧，让队伍整装再出发"; pos++;
tips[pos] = "肉包可以大量回复全队的生命值"; pos++;
tips[pos] = "泡泡除了能保护英雄免于撞击之外，也可以阻挡敌人的数次攻击"; pos++;
tips[pos] = "双刃可以提升全队​​英雄的攻击速度"; pos++;
tips[pos] = "蓝袍道士会帮周围的同伴治疗，优先打倒他吧"; pos++;
tips[pos] = "斗笠武僧的法术会减缓英雄们的移动速度"; pos++;
tips[pos] = "庞统的「寒冰」能暂时冻结敌人的动作"; pos++;
tips[pos] = "魏延的「麻痹」能减缓敌人的移动速度"; pos++;
tips[pos] = "关平的「先机」能增加全队英雄的攻击范围视野"; pos++;
tips[pos] = "华陀的「疗伤」能在攻击时治疗我方英雄"; pos++;
//tips[pos] = "孟获的「爆轰」会提升游戏中所有炸弹的威力"; pos++;
tips[pos] = "刘备的「魅力」能提高游戏中其他英雄加入的机率"; pos++;
tips[pos] = "打倒敌人所获得的经验值，会累计在领队的英雄身上"; pos++;
tips[pos] = "提升英雄的等级，让你的队伍更强大"; pos++;
tips[pos] = "等级达到最大时，会启动英雄最强的天赋，提升英雄的等级吧"; pos++;
tips[pos] = "武将的等级越高，身上的装备也会变得越华丽"; pos++;
tips[pos] = "１枚金币相当于５枚银币，优先拾取金币吧"; pos++;
tips[pos] = "龙珠是稀有的宝物，除了能在商店购买，有时也会在游戏中掉落"; pos++;

var randPos = irandom(maxTips-1);
return tips[randPos];
