var maxTips = 18;
var tips;
var pos = 0;

tips[pos] = "勇猛的英雄是不會向後轉的，遇見障礙物時向左或向右移動吧"; pos++;
tips[pos] = "出陣前購買各種【神 器】吧，讓隊伍整裝再出發"; pos++;
tips[pos] = "肉包可以回復全隊的生命值"; pos++;
tips[pos] = "泡泡除了能保護英雄免於撞擊之外，也可以阻擋敵人的數次攻擊"; pos++;
tips[pos] = "雙刃可以提升全隊英雄的攻擊速度"; pos++;
tips[pos] = "藍袍道士會幫周圍的同伴治療，優先打倒他吧"; pos++;
tips[pos] = "斗笠武僧的法術會減緩英雄們的移動速度"; pos++;
tips[pos] = "劉備的「魅力」能提高遊戲中其他英雄加入的機率"; pos++;
tips[pos] = "龐統的「寒冰」能暫時凍結敵人的動作"; pos++;
tips[pos] = "魏延的「麻痺」能減緩敵人的移動速度"; pos++;
tips[pos] = "關平的「先機」能增加全隊英雄的攻擊範圍視野"; pos++;
tips[pos] = "華陀的「療傷」能在攻擊時治療我方英雄"; pos++;
//tips[pos] = "孟獲的「爆轟」會提升遊戲中所有炸彈的威力"; pos++;
tips[pos] = "打倒敵人所獲得的經驗值，會累計在領隊的英雄身上"; pos++;
tips[pos] = "提升英雄的等級，讓你的隊伍更強大"; pos++;
tips[pos] = "等級達到最大時，會啟動英雄最強的天賦，提升英雄的等級吧"; pos++;
tips[pos] = "武將的等級越高，身上的裝備也會變得越華麗"; pos++;
tips[pos] = "１枚金幣相當於５枚銀幣，優先拾取金幣吧"; pos++;
tips[pos] = "龍珠是稀有的寶物，除了能在商店購買，有時也會在遊戲中掉落"; pos++;

var randPos = irandom(maxTips-1);
return tips[randPos];

