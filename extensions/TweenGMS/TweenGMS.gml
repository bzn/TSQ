#define Ease
/*
    Ease(value1, value2, amount, ease);
*/

return script_execute(argument3, argument2, argument0, argument1 - argument0, 1);

#define TweenGMS_Init
/*
    TweenGMS_Init();
    Called automatically by GEX Init Function
*/

//  Declare global variable for holding shared tweener instance
global.TGMS_SharedTweener = noone;

//  Create Default Tween Template
global.TGMS_TweenDefault = ds_list_create();

var _tween = global.TGMS_TweenDefault;
ds_list_add(_tween, noone); // 0 instance
ds_list_add(_tween, 0); // 1 property
ds_list_add(_tween, 0); // 2 start
ds_list_add(_tween, 0); // 3 destination
ds_list_add(_tween, 0); // 4 duration
ds_list_add(_tween, 0); // 5 ease
ds_list_add(_tween, 0); // 6 play mode
ds_list_add(_tween, -1); // simple tween key
ds_list_add(_tween, 0); // 8 change
ds_list_add(_tween, 0); // 9 time
ds_list_add(_tween, 1); // 10 speed
ds_list_add(_tween, -1); // 11 state
ds_list_add(_tween, 0); // 12 group
ds_list_add(_tween, -1); // 13 on play
ds_list_add(_tween, -1); // 14 on finish
ds_list_add(_tween, -1); // 15 on stop
ds_list_add(_tween, -1); // 16 on pause
ds_list_add(_tween, -1); // 17 on resume
ds_list_add(_tween, -1); // 18 on loop
ds_list_add(_tween, -1); // 19 on repeat
ds_list_add(_tween, -1); // 20 on bounce
ds_list_add(_tween, false); // 21 is Delta?

// Create Null Tween
global.TGMS_TweenNull = ds_list_create();
ds_list_copy(global.TGMS_TweenNull, global.TGMS_TweenDefault);

#define TweenGMS_Final
/*
    TweenGMS_Final()
    Called automatically by GEX Final Function
*/

//  Delete default tween template
ds_list_destroy(global.TGMS_TweenDefault);
ds_list_destroy(global.TGMS_TweenNull);

#define SharedTweener
/*
    SharedTweener();
    Creates or Returns Shared Tweener Singleton
*/

if (global.TGMS_SharedTweener == noone)
{
    instance_create(-1000000, -1000000, shared_Tweener)
}

return (global.TGMS_SharedTweener);

#define SharedTweenerActivate
/*
    SharedTweenerActivate();
*/

if (global.TGMS_SharedTweener != noone)
{
    instance_activate_object(global.TGMS_SharedTweener);
}

#define TweenSystemGetUpdateInterval
/*
    TweenSystemGetUpdateInterval();
*/

return ((SharedTweener()).updateInterval);

#define TweenSystemSetUpdateInterval
/*
    TweenSystemSetUpdateInterval(steps);
*/

(SharedTweener()).updateInterval = argument0;

#define TweenSystemPause
/*
    TweenSystemPause();
*/

(SharedTweener()).isActive = false;

#define TweenSystemResume
/*
    TweenSystemResume();
*/

(SharedTweener()).isActive = true;

#define TweenSystemIsActive
/*
    TweenSystemIsActive();
    Returns boolean
*/

return ((SharedTweener()).isActive);

#define TweenCreate
/*
    TweenCreate(instance);
*/

//  Create data structure to hold tween data
var _tween = ds_list_create(); 

//  Copy default tween data
ds_list_copy(_tween, global.TGMS_TweenDefault);

//  Set tweened instance
ds_list_replace(_tween, 0, argument0);

//  Place tween into automated tween list
ds_list_add(SharedTweener().tweens, _tween);

//  Return tween handle
return _tween;

#define TweenDeltaCreate
/*
    TweenDeltaCreate(instance);
*/

//  Create data structure to hold tween data
var _tween = ds_list_create(); 

//  Copy default tween data
ds_list_copy(_tween, global.TGMS_TweenDefault);

//  Set tweened instance
ds_list_replace(_tween, 0, argument0);

//  Set delta boolean
ds_list_replace(_tween, 21, true);

//  Place tween into automated tween list
ds_list_add(SharedTweener().deltaTweens, _tween);

//  Return tween handle
return _tween;

#define TweenDestroy
/*
    TweenDestroy(tween);
*/

//  Mark tween for destruction
ds_list_replace(argument0, 0, noone);
ds_list_replace(argument0, 11, -2);

return global.TGMS_TweenNull;

#define TweenDestroyAll
/*
    TweenDestroyAll();
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens; 

var _index = ds_list_size(_tweens);
while(_index--)
{    
    TweenDestroy(ds_list_find_value(_tweens, _index));
}

var _index = ds_list_size(_deltaTweens);
while(_index--)
{    
    TweenDestroy(ds_list_find_value(_deltaTweens, _index));
}

#define TweenDestroyGroup
/*
    TweenDestroyGroup(group);
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens; 

var _index = ds_list_size(_tweens);
while(_index--)
{    
    var _tween = ds_list_find_value(_tweens, _index);
    
    if (TweenGetGroup(_tween) == argument0)
        TweenDestroy(_tween);
}

var _index = ds_list_size(_deltaTweens);
while(_index--)
{    
    var _tween = ds_list_find_value(_deltaTweens, _index);
    
    if (TweenGetGroup(_tween) == argument0)
        TweenDestroy(_tween);
}

#define TweenNull
/*
    TweenNull();
*/

return global.TGMS_TweenNull;

#define TweenPlayOnce
/*
    TweenPlayOnce(tween, property, start, destination, duration, EASE);
*/

var _tween = argument0;

if (ds_list_find_value(_tween, 11) != -2)
{
    //  Get Calculated Change
    var _change = (argument3 - argument2);
    
    // Only Play if Change and Duration are not Zero
    if ((_change != 0) && (argument4 > 0))
    {
        ds_list_replace(_tween, 1, argument1); // set property
        ds_list_replace(_tween, 2, argument2); // Set start
        ds_list_replace(_tween, 3, argument3); // Set destination
        ds_list_replace(_tween, 4, argument4); // Set duration
        ds_list_replace(_tween, 5, argument5); // Set easing algorithm
        ds_list_replace(_tween, 6, TWEEN_PLAY_ONCE); // Set TWEEN_PLAY mode
        ds_list_replace(_tween, 8, _change); // Set calculated change (destination - start)
        ds_list_replace(_tween, 9, 0); // Set timer value to 0
        ds_list_replace(_tween, 10, 1); // Default speed to 1
        ds_list_replace(_tween, 11, 1); // Set tween state to active
        with(ds_list_find_value(_tween, 0)) script_execute(argument1, argument2); // Set tweened variable to start value
    }
    
    ExecuteTweenEvent(_tween, 13);
}

#define TweenPlayLoop
/*
    TweenPlayLoop(tween, property, start, destination, duration, EASE);
*/

TweenPlayOnce(argument0, argument1, argument2, argument3, argument4, argument5);
ds_list_replace(argument0, 6, TWEEN_PLAY_LOOP);

#define TweenPlayRepeat
/*
    TweenPlayRepeat(tween, property, start, destination, duration, EASE);
*/

TweenPlayOnce(argument0, argument1, argument2, argument3, argument4, argument5);
ds_list_replace(argument0, 6, TWEEN_PLAY_REPEAT);

#define TweenPlayBounce
/*
    TweenPlayBounce(tween, property, start, destination, duration, EASE);
*/

TweenPlayOnce(argument0, argument1, argument2, argument3, argument4, argument5);
ds_list_replace(argument0, 6, TWEEN_PLAY_BOUNCE);

#define TweenPlayPatrol
/*
    TweenPlayPatrol(tween, property, start, destination, duration, ease);
*/

TweenPlayOnce(argument0, argument1, argument2, argument3, argument4, argument5);
ds_list_replace(argument0, 6, TWEEN_PLAY_PATROL);

#define TweenPlayOnceDelay

/*
    TweenPlayOnceDelay(tween, property, start, destination, duration, EASE);
*/

var _delayInfo = ds_list_create();

ds_list_add(_delayInfo, argument0); // tween
ds_list_add(_delayInfo, argument1); // property
ds_list_add(_delayInfo, argument2); // start
ds_list_add(_delayInfo, argument3); // destination
ds_list_add(_delayInfo, argument4); // duration
ds_list_add(_delayInfo, argument5); // ease
ds_list_add(_delayInfo, argument6); // delay
ds_list_add(_delayInfo, TWEEN_PLAY_ONCE); // play mode
ds_list_add(_delayInfo, ds_list_find_value(argument0, 21)); // isDelta


ds_list_add((SharedTweener()).delayedTweens, _delayInfo);

#define TweenPlayLoopDelay

/*
    TweenPlayRepeatDelay(tween, property, start, destination, duration, EASE);
*/

var _delayInfo = ds_list_create();

ds_list_add(_delayInfo, argument0); // tween
ds_list_add(_delayInfo, argument1); // property
ds_list_add(_delayInfo, argument2); // start
ds_list_add(_delayInfo, argument3); // destination
ds_list_add(_delayInfo, argument4); // duration
ds_list_add(_delayInfo, argument5); // EASE
ds_list_add(_delayInfo, argument6); // delay
ds_list_add(_delayInfo, TWEEN_PLAY_LOOP); // play mode
ds_list_add(_delayInfo, TweenGetInstance(argument0)); // instance
ds_list_add(_delayInfo, ds_list_find_value(argument0, 21)); // isDelta

ds_list_add((SharedTweener()).delayedTweens, _delayInfo);


#define TweenPlayRepeatDelay

/*
    TweenPlayRepeatDelay(tween, property, start, destination, duration, EASE);
*/

var _delayInfo = ds_list_create();

ds_list_add(_delayInfo, argument0); // tween
ds_list_add(_delayInfo, argument1); // property
ds_list_add(_delayInfo, argument2); // start
ds_list_add(_delayInfo, argument3); // destination
ds_list_add(_delayInfo, argument4); // duration
ds_list_add(_delayInfo, argument5); // EASE
ds_list_add(_delayInfo, argument6); // delay
ds_list_add(_delayInfo, TWEEN_PLAY_REPEAT); // play mode
ds_list_add(_delayInfo, TweenGetInstance(argument0)); // instance
ds_list_add(_delayInfo, ds_list_find_value(argument0, 21)); // isDelta

ds_list_add((SharedTweener()).delayedTweens, _delayInfo);


#define TweenPlayBounceDelay

/*
    TweenPlayBounceDelay(tween, property, start, destination, duration, EASE);
*/

var _delayInfo = ds_list_create();

ds_list_add(_delayInfo, argument0); // tween
ds_list_add(_delayInfo, argument1); // property
ds_list_add(_delayInfo, argument2); // start
ds_list_add(_delayInfo, argument3); // destination
ds_list_add(_delayInfo, argument4); // duration
ds_list_add(_delayInfo, argument5); // EASE
ds_list_add(_delayInfo, argument6); // delay
ds_list_add(_delayInfo, TWEEN_PLAY_BOUNCE); // play mode
ds_list_add(_delayInfo, TweenGetInstance(argument0)); // instance
ds_list_add(_delayInfo, ds_list_find_value(argument0, 21)); // isDelta

ds_list_add((SharedTweener()).delayedTweens, _delayInfo);


#define TweenPlayPatrolDelay

/*
    TweenPlayBounceDelay(tween, tween, start, destination, duration, EASE);
*/

var _delayInfo = ds_list_create();

ds_list_add(_delayInfo, argument0); // tween
ds_list_add(_delayInfo, argument1); // property
ds_list_add(_delayInfo, argument2); // start
ds_list_add(_delayInfo, argument3); // destination
ds_list_add(_delayInfo, argument4); // duration
ds_list_add(_delayInfo, argument5); // EASE
ds_list_add(_delayInfo, argument6); // delay
ds_list_add(_delayInfo, TWEEN_PLAY_PATROL); // play mode
ds_list_add(_delayInfo, TweenGetInstance(argument0)); // instance
ds_list_add(_delayInfo, ds_list_find_value(argument0, 21)); // isDelta

ds_list_add((SharedTweener()).delayedTweens, _delayInfo);


#define TweenStop
/* 
    TweenStop(tween);
*/

if (ds_list_find_value(argument0, 11) != -2)
{
    ds_list_replace(argument0, 11, -1);
    ExecuteTweenEvent(argument0, 15);
}

#define TweenStopAll
/*
    TweenStopAll();
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens;

for (var i = 0, _maxIndex = ds_list_size(_tweens); i < _maxIndex; i++)
{
    TweenStop(ds_list_find_value(_tweens, i));
}

for (var i = 0, _maxIndex = ds_list_size(_deltaTweens); i < _maxIndex; i++)
{
    TweenStop(ds_list_find_value(_deltaTweens, i));
}

#define TweenStopGroup
/*
    TweenStopGroup(group);
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens;

for (var i = 0, _maxIndex = ds_list_size(_tweens); i < _maxIndex; i++)
{
    var _tween = ds_list_find_value(_tweens, i);
    
    if (ds_list_find_value(_tween, 12) == argument0)
        TweenStop(_tween);
}

for (var i = 0, _maxIndex = ds_list_size(_deltaTweens); i < _maxIndex; i++)
{
    var _tween = ds_list_find_value(_deltaTweens, i);
    
    if (ds_list_find_value(_tween, 12) == argument0)
        TweenStop(_tween);
}

#define TweenPause
/*
    TweenPause(tween);
*/

if (ds_list_find_value(argument0, 11) == 1)
{
    ds_list_replace(argument0, 11, 0);
    ExecuteTweenEvent(argument0, 16);
}

#define TweenPauseAll
/*
    TweenPauseAll();
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens;

for (var i = 0, _maxIndex = ds_list_size(_tweens); i < _maxIndex; i++)
{
    TweenPause(ds_list_find_value(_tweens, i));
}

for (var i = 0, _maxIndex = ds_list_size(_deltaTweens); i < _maxIndex; i++)
{
    TweenPause(ds_list_find_value(_deltaTweens, i));
}


#define TweenPauseGroup
/*
    TweenPauseGroup(group);
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens;

for (var i = 0, _maxIndex = ds_list_size(_tweens); i < _maxIndex; i++)
{
    var _tween = ds_list_find_value(_tweens, i);
    
    if (ds_list_find_value(_tween, 12) == argument0)
        TweenPause(_tween);
}

for (var i = 0, _maxIndex = ds_list_size(_deltaTweens); i < _maxIndex; i++)
{
    var _tween = ds_list_find_value(_deltaTweens, i);
    
    if (ds_list_find_value(_tween, 12) == argument0)
        TweenPause(_tween);
}

#define TweenResume
/*
    TweenResume(tween);
*/

if (ds_list_find_value(argument0, 11) == 0)
{
    ds_list_replace(argument0, 11, 1);
    ExecuteTweenEvent(argument0, 17);
}

#define TweenResumeAll
/*
    TweenResumeAll();
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens;

for (var i = 0, _maxIndex = ds_list_size(_tweens); i < _maxIndex; i++)
{
    TweenResume(ds_list_find_value(_tweens, i));
}

for (var i = 0, _maxIndex = ds_list_size(_deltaTweens); i < _maxIndex; i++)
{
    TweenResume(ds_list_find_value(_deltaTweens, i));
}


#define TweenResumeGroup
/*
    TweenResumeGroup(group);
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens;

for (var i = 0, _maxIndex = ds_list_size(_tweens); i < _maxIndex; i++)
{
    var _tween = ds_list_find_value(_tweens, i);
    
    if (ds_list_find_value(_tween, 12) == argument0)
    {
        TweenResume(_tween);
    }
}

for (var i = 0, _maxIndex = ds_list_size(_deltaTweens); i < _maxIndex; i++)
{
    var _tween = ds_list_find_value(_deltaTweens, i);
    
    if (ds_list_find_value(_tween, 12) == argument0)
    {
        TweenResume(_tween);
    }
}

#define TweenReverse
/*
    TweenReverse(tween);
*/

ds_list_replace(argument0, 10, -ds_list_find_value(argument0, 10));


#define TweenReverseAll
/*
    TweenReverseAll();
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens;

for (var i = 0, _maxIndex = ds_list_size(_tweens); i < _maxIndex; i++)
{
    TweenReverse(ds_list_find_value(_tweens, i));
}

for (var i = 0, _maxIndex = ds_list_size(_deltaTweens); i < _maxIndex; i++)
{
    TweenReverse(ds_list_find_value(_deltaTweens, i));
}

#define TweenReverseGroup
/*
    TweenReverseGroup(group);
*/

var _sharedTweener = SharedTweener();
var _tweens = _sharedTweener.tweens;
var _deltaTweens = _sharedTweener.deltaTweens;

for (var i = 0, _maxIndex = ds_list_size(_tweens); i < _maxIndex; i++)
{
    _tween = ds_list_find_value(_tweens, i);
    
    if (ds_list_find_value(_tween, 12) == argument0)
        TweenReverse(_tween);
}

for (var i = 0, _maxIndex = ds_list_size(_deltaTweens); i < _maxIndex; i++)
{
    _tween = ds_list_find_value(_deltaTweens, i);
    
    if (ds_list_find_value(_tween, 12) == argument0)
        TweenReverse(_tween);
}

#define TweenSimpleMove
/*
    TweenSimpleMove(xStart, yStart, xDest, yDest, duration, ease);
*/

var _key = (id + 100000000);

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_x = TweenCreate(id);
    TGMS_simple_y = TweenCreate(id);
    ds_list_replace(TGMS_simple_x, 7, _key);
}

TweenPlayOnce(TGMS_simple_x, x__, argument0, argument2, argument4, argument5);
TweenPlayOnce(TGMS_simple_y, y__, argument1, argument3, argument4, argument5);

#define TweenSimpleMoveInt
/*
    TweenSimpleMoveRound(xStart, yStart, xDest, yDest, duration, ease);
*/

var _key = id + 100000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_x = TweenCreate(id);
    TGMS_simple_y = TweenCreate(id);
    ds_list_replace(TGMS_simple_x, 7, _key);
}

TweenPlayOnce(TGMS_simple_x, x__int, argument0, argument2, argument4, argument5);
TweenPlayOnce(TGMS_simple_y, y__int, argument1, argument3, argument4, argument5);

#define TweenSimpleFade
/*
    TweenSimpleFade(alpha1, alpha2, duration, ease);
*/

var _key = id + 200000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_fade = TweenCreate(id);
    ds_list_replace(TGMS_simple_fade, 7, _key);
}

TweenPlayOnce(TGMS_simple_fade, image_alpha__, argument0, argument1, argument2, argument3);

#define TweenSimpleScale
/*
    TweenSimpleScale(xScale1, yScale1, xScale2, yScale2, duration, ease);
*/

var _key = id + 300000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_xscale = TweenCreate(id);
    TGMS_simple_yscale = TweenCreate(id);
    ds_list_replace(TGMS_simple_xscale, 7, _key);
}

TweenPlayOnce(TGMS_simple_xscale , image_xscale__, argument0, argument2, argument4, argument5);
TweenPlayOnce(TGMS_simple_yscale , image_yscale__, argument1, argument3, argument4, argument5);

#define TweenSimpleTurn
/*
    TweenSimpleTurn(direction1, direction2, duration, ease);
*/

var _key = id + 400000000;;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_turn = TweenCreate(id);
    ds_list_replace(TGMS_simple_turn, 7, _key);
}

TweenPlayOnce(TGMS_simple_turn, direction__, argument0, argument1, argument2, argument3);


#define TweenSimpleRotate
/*
    TweenSimpleRotate(angle1, angle2, duration, ease);
*/

var _key = id + 500000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_rotate = TweenCreate(id);
    ds_list_replace(TGMS_simple_rotate, 7, _key);
}

TweenPlayOnce(TGMS_simple_rotate, image_angle__, argument0, argument1, argument2, argument3);

#define TweenSimpleImageCycle
/*
    TweenSimpleImageCycle(alpha1, alpha2, duration, ease);
*/

var _key = id + 600000000;;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_image_cycle = TweenCreate(id);
    ds_list_replace(TGMS_simple_image_cycle, 7, _key);
}

TweenPlayOnce(TGMS_simple_image_cycle, image_index__, argument0, argument1, argument2, argument3);

#define TweenSimpleSpeedRamp
/*
    TweenSimpleSpeedRamp(speed1, speed2, duration, ease);
*/

var _key = id + 700000000;;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_speed_ramp = TweenCreate(id);
    ds_list_replace(TGMS_simple_speed_ramp, 7, _key);
}

TweenPlayOnce(TGMS_simple_speed_ramp, speed__, argument0, argument1, argument2, argument3);

#define TweenSimpleHVSpeedRamp
/*
    TweenSimpleHVSpeedRamp(hspeed1, vspeed1, hspeed2, vspeed2, duration, ease);
*/

var _key = id + 800000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_hspeed_ramp = TweenCreate(id);
    TGMS_simple_vspeed_ramp = TweenCreate(id);
    ds_list_replace(TGMS_simple_hspeed_ramp, 7, _key);
}

TweenPlayOnce(TGMS_simple_hspeed_ramp, hspeed__, argument0, argument2, argument4, argument5);
TweenPlayOnce(TGMS_simple_vspeed_ramp, vspeed__, argument1, argument3, argument4, argument5);

#define TweenSimpleMoveDelay
/*
    TweenSimpleMoveDelay(xStart, yStart, xDest, yDest, duration, ease, delay);
*/

var _key = id + 100000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_x = TweenCreate(id);
    TGMS_simple_y = TweenCreate(id);
    ds_list_replace(TGMS_simple_x, 7, _key);
}

TweenPlayOnceDelay(TGMS_simple_x, x__, argument0, argument2, argument4, argument5, argument6);
TweenPlayOnceDelay(TGMS_simple_y, y__, argument1, argument3, argument4, argument5, argument6);

#define TweenSimpleMoveIntDelay
/*
    TweenSimpleMoveRoundDelay(xStart, yStart, xDest, yDest, duration, ease, delay);
*/

var _key = id + 100000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_x = TweenCreate(id);
    TGMS_simple_y = TweenCreate(id);
    ds_list_replace(TGMS_simple_x, 7, _key);
}

TweenPlayOnceDelay(TGMS_simple_x, x__int, argument0, argument2, argument4, argument5, argument6);
TweenPlayOnceDelay(TGMS_simple_y, y__int, argument1, argument3, argument4, argument5, argument6);

#define TweenSimpleFadeDelay
/*
    TweenSimpleFadeDelay(alphaStart, alphaEnd, duration, ease, delay);
*/

var _key = id + 200000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_fade = TweenCreate(id);
    ds_list_replace(TGMS_simple_fade, 7, _key);
}

TweenPlayOnceDelay(TGMS_simple_fade, image_alpha__, argument0, argument1, argument2, argument3, argument4);

#define TweenSimpleScaleDelay
/*
    TweenSimpleScaleDelay(xStart, yStart, xDest, yDest, duration, ease, delay);
*/

var _key = id + 300000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_xscale = TweenCreate(id);
    TGMS_simple_yscale = TweenCreate(id);
    ds_list_replace(TGMS_simple_xscale, 7, _key);
}

TweenPlayOnceDelay(TGMS_simple_xscale , image_xscale__, argument0, argument2, argument4, argument5, argument6);
TweenPlayOnceDelay(TGMS_simple_yscale , image_yscale__, argument1, argument3, argument4, argument5, argument6);

#define TweenSimpleTurnDelay
/*
    TweenSimpleTurnDelay(direction_start, direction_end, duration, ease, delay);
*/

var _key = id + 400000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_turn = TweenCreate(id);
    ds_list_replace(TGMS_simple_turn, 7, _key);
}

TweenPlayOnceDelay(TGMS_simple_turn, direction__, argument0, argument1, argument2, argument3, argument4);

#define TweenSimpleRotateDelay
/*
    TweenSimpleRotateDelay(angle_start, angle_end, duration, ease, delay);
*/

var _key = id + 500000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_rotate = TweenCreate(id);
    ds_list_replace(TGMS_simple_rotate, 7, _key);
}

TweenPlayOnceDelay(TGMS_simple_rotate, image_angle__, argument0, argument1, argument2, argument3, argument4);

#define TweenSimpleImageCycleDelay
/*
    TweenSimpleImageCycleDelay(alphaStart, alphaEnd, duration, ease, delay);
*/

var _key = id + 600000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_image_cycle = TweenCreate(id);
    ds_list_replace(TGMS_simple_image_cycle, 7, _key);
}

TweenPlayOnceDelay(TGMS_simple_image_cycle, image_index__, argument0, argument1, argument2, argument3, argument4);

#define TweenSimpleSpeedRampDelay
/*
    TweenSimpleSpeedRampDelay(speed1, speed2, duration, ease, delay);
*/

var _key = id + 700000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_speed_ramp = TweenCreate(id);
    ds_list_replace(TGMS_simple_speed_ramp, 7, _key);
}

TweenPlayOnceDelay(TGMS_simple_speed_ramp, speed__, argument0, argument1, argument2, argument3, argument4);

#define TweenSimpleHVSpeedRampDelay
/*
    TweenSimpleHVSpeedRampDelay(hspeed1, vspeed1, hspeed2, vspeed2, duration, ease, delay);
*/

var _key = id + 800000000;

if (ds_map_exists((SharedTweener()).simpleTweens, _key) == false)
{
    ds_map_add((SharedTweener()).simpleTweens, _key, id);
    TGMS_simple_hspeed_ramp = TweenCreate(id);
    TGMS_simple_vspeed_ramp = TweenCreate(id);
    ds_list_replace(TGMS_simple_hspeed_ramp, 7, _key);
}

TweenPlayOnceDelay(TGMS_simple_hspeed_ramp, hspeed__, argument0, argument2, argument4, argument5, argument6);
TweenPlayOnceDelay(TGMS_simple_vspeed_ramp, vspeed__, argument1, argument3, argument4, argument5, argument6);

#define TweenGetInstance
/*
    TweenGetInstance(tween);
*/

return ds_list_find_value(argument0, 0);

#define TweenGetProperty
/*
    TweenGetVariableReference(tween);
*/

return ds_list_find_value(argument0, 1);

#define TweenGetStart
/*
    TweenGetStart(tween)
*/

return ds_list_find_value(argument0, 2);

#define TweenGetDestination
/*
    TweenGetDestination(tween);
*/

return ds_list_find_value(argument0, 3);

#define TweenGetDuration
/*
    TweenGetDuration(tween);
*/

return ds_list_find_value(argument0, 4);

#define TweenGetEase
/*
    TweenGetEase(tween);
*/

return ds_list_find_value(argument0, 5);

#define TweenGetPlayMode
/*
    TweenGetBound(tween);
*/

return ds_list_find_value(argument0, 6);

#define TweenGetChange
/*
    TweenGetChange(tween);
*/

return ds_list_find_value(argument0, 8);

#define TweenGetTime
/*
    TweenGetTime(tween);
*/

return ds_list_find_value(argument0, 9);

#define TweenGetSpeed
/*
    TweenGetSpeed(tween);
*/

return ds_list_find_value(argument0, 10);


#define TweenGetState
/*
    TweenGetState(tween);
*/

return ds_list_find_value(argument0, 11);

#define TweenGetGroup
/*
    TweenGetGroup(tween);
*/

return ds_list_find_value(argument0, 12);

#define TweenSetInstance
/*
    TweenSetInstance(tween, instance);
*/

if (ds_list_find_value(argument0, 0) != noone)
{
    ds_list_replace(argument0, 0, argument1);
}

#define TweenSetProperty
/*
    TweenSetProperty(tween, property);
*/

ds_list_replace(argument0, 1, argument1);

#define TweenSetStart
/*
    TweenSetStart(tween, start)
*/

//  Set New Start Position
ds_list_replace(argument0, 2, argument1);

//  Calculate New Change
ds_list_replace(argument0, 8, ds_list_find_value(argument0, 3) - ds_list_find_value(argument0, 2));


#define TweenSetDestination
/*
    TweenSetDestination(tween, destination);
*/

//  Set New Destination
ds_list_replace(argument0, 3, argument1);

//  Set New Calculated Change
ds_list_replace(argument0, 8, ds_list_find_value(argument0, 3) - ds_list_find_value(argument0, 2));

#define TweenSetDuration
/*
    TweenSetDuration(tween, duration);
*/

ds_list_replace(argument0, 4, argument1);

#define TweenSetEase
/*
    TweenSetEase(tween, ease);
*/

ds_list_replace(argument0, 5, argument1);

#define TweenSetPlayMode
/*
    TweenSetPlayMode(tween, TWEEN_PLAY_CONSTANT);
*/

// needs to be changed to take constant

ds_list_replace(argument0, 6, argument1);

#define TweenSetSpeed
/*
    TweenSetSpeed(tween, speed);
    default speed = 1;
*/

ds_list_replace(argument0, 10, argument1*sign(ds_list_find_value(argument0, 10)));



#define TweenSetTime
/*
    TweenSetSpeed(tween, time);
*/

var _tween = argument0;
var _newTime = argument1;

//  Assign new time value
ds_list_replace(_tween, 9, _newTime);

//  Calculate new position for updated time
with(ds_list_find_value(_tween, 0))
{
    with (ds_list_find_value(_tween, 0)) script_execute(ds_list_find_value(_tween, 1), script_execute(ds_list_find_value(_tween, 5), _newTime, ds_list_find_value(_tween, 2), ds_list_find_value(_tween, 8), ds_list_find_value(_tween, 4)));
}




#define TweenSetGroup
/*
    TweenSetGroup(tween, group);
*/

ds_list_replace(argument0, 12, argument1);

#define TweenIsActive
/*
    TweenIsActive(tween);
*/

return (ds_list_find_value(argument0, 11) == 1);


#define TweenIsStopped
/*
    TweenIsStopped(tween);
*/

return (ds_list_find_value(argument0, 11) == -1);

#define TweenIsPaused
/*
    TweenIsActive(tween);
*/

return (ds_list_find_value(argument0, 11) == 0);

#define TweenIsDelta
/*
    TweenIsDelta(tween);
*/

return ds_list_find_value(argument0, 21);


#define ExecuteTweenEvent
/*
    ExecuteTweenEvent(tween, event);
    -- Needs some minor changes
       * change queue to stack / remove need for ds_list_find_index
*/

var _event = ds_list_find_value(argument0, argument1);

if (_event == -1)
    exit;

var _cleanQueue = -1;
var _eventSize = ds_list_size(_event);

for (var i = 0; i < _eventSize; i++)
{
    var _action = ds_list_find_value(_event, i);
    var _target = ds_list_find_value(_action, 0);
    var _script = ds_list_find_value(_action, 1);
    var _args = ds_list_find_value(_action, 2);

    if (instance_exists(_target))
    {
        with (_target)
        {
            switch(ds_list_size(_args))
            {
            case 0: script_execute(_script); break;
            case 1: script_execute(_script, ds_list_find_value(_args, 0)); break;
            case 2: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1)); break;
            case 3: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2)); break;
            case 4: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3)); break;
            case 5: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4)); break;
            case 6: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5)); break;
            case 7: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6)); break;
            case 8: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7)); break;
            case 9: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8)); break;
            case 10: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9)); break;
            case 11: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10)); break;
            case 12: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10), ds_list_find_value(_args, 11)); break;
            case 13: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10), ds_list_find_value(_args, 11), ds_list_find_value(_args, 12)); break;
            case 14: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10), ds_list_find_value(_args, 11), ds_list_find_value(_args, 12), ds_list_find_value(_args, 13)); break;
            case 15: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10), ds_list_find_value(_args, 11), ds_list_find_value(_args, 12), ds_list_find_value(_args, 13), ds_list_find_value(_args, 14)); break;
            }
        }
    }
    else
    {
        instance_activate_object(_target)
        
        if (instance_exists(_target))
        {   
            with (_target)
            {
                switch(ds_list_size(_args))
                {
                case 0: script_execute(_script); break;
                case 1: script_execute(_script, ds_list_find_value(_args, 0)); break;
                case 2: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1)); break;
                case 3: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2)); break;
                case 4: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3)); break;
                case 5: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4)); break;
                case 6: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5)); break;
                case 7: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6)); break;
                case 8: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7)); break;
                case 9: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8)); break;
                case 10: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9)); break;
                case 11: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10)); break;
                case 12: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10), ds_list_find_value(_args, 11)); break;
                case 13: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10), ds_list_find_value(_args, 11), ds_list_find_value(_args, 12)); break;
                case 14: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10), ds_list_find_value(_args, 11), ds_list_find_value(_args, 12), ds_list_find_value(_args, 13)); break;
                case 15: script_execute(_script, ds_list_find_value(_args, 0), ds_list_find_value(_args, 1), ds_list_find_value(_args, 2), ds_list_find_value(_args, 3), ds_list_find_value(_args, 4), ds_list_find_value(_args, 5), ds_list_find_value(_args, 6), ds_list_find_value(_args, 7), ds_list_find_value(_args, 8), ds_list_find_value(_args, 9), ds_list_find_value(_args, 10), ds_list_find_value(_args, 11), ds_list_find_value(_args, 12), ds_list_find_value(_args, 13), ds_list_find_value(_args, 14)); break;
                }
            } 
            
            instance_deactivate_object(_target);
        }
        else
        {
            if (_cleanQueue == -1)
                _cleanQueue = ds_queue_create();
            
            ds_queue_enqueue(_cleanQueue, _action);
        }
    }
}

if (_cleanQueue != -1)
{
    repeat(ds_queue_size(_cleanQueue))
    {
        _action = ds_queue_dequeue(_cleanQueue); // fetch action
        ds_list_destroy(ds_list_find_value(_action, 2)); // destroy arguments
        ds_list_delete(_event, ds_list_find_index(_event, _action)); // remove action from event
        ds_list_destroy(_action); // destroy action
    }
}

#define TweenOnPlayAdd
/*
    TweenOnPlayAdd(tween, caller, script, TArgs(arg1, arg2, ...))
    Returns: Handle
*/

var _event = ds_list_find_value(argument0, 13);
var _action = ds_list_create();
var _arguments = argument3;

// create event if it doesn't exists
if (_event == -1)
{
    _event = ds_list_create();
    ds_list_replace(argument0, 13, _event);
}

ds_list_add(_action, argument1); // assign caller
ds_list_add(_action, argument2); // assign script
ds_list_add(_action, _arguments); // assign arguments
ds_list_add(_event, _action); // add action to the event

return _action;

#define TweenOnFinishAdd
/*
    TweenOnFinishAdd(tween, caller, script, -1 or TArgs(arg1, arg2, ...))
    Returns: Handle
*/

var _event = ds_list_find_value(argument0, 14);
var _action = ds_list_create();
var _arguments = argument3;

// create event if it doesn't exists
if (_event == -1)
{
    _event = ds_list_create();
    ds_list_replace(argument0, 14, _event);
}

ds_list_add(_action, argument1); // assign caller
ds_list_add(_action, argument2); // assign script
ds_list_add(_action, _arguments); // assign arguments
ds_list_add(_event, _action); // add action to the event

return _action;

#define TweenOnStopAdd
/*
    TweenOnStopAdd(tween, caller, script, -1 or TArgs(arg1, arg2, ...))
    Returns: Handle
*/

var _event = ds_list_find_value(argument0, 15);
var _action = ds_list_create();
var _arguments = argument3;

// create event if it doesn't exists
if (_event == -1)
{
    _event = ds_list_create();
    ds_list_replace(argument0, 15, _event);
}

ds_list_add(_action, argument1); // assign caller
ds_list_add(_action, argument2); // assign script
ds_list_add(_action, _arguments); // assign arguments
ds_list_add(_event, _action); // add action to the event

return _action;

#define TweenOnPauseAdd
/*
    TweenOnPauseAdd(tween, caller, script, -1 or TArgs(arg1, arg2, ...))
    Returns: Handle
*/

var _event = ds_list_find_value(argument0, 16);
var _action = ds_list_create();
var _arguments = argument3;

// create event if it doesn't exists
if (_event == -1)
{
    _event = ds_list_create();
    ds_list_replace(argument0, 16, _event);
}

ds_list_add(_action, argument1); // assign caller
ds_list_add(_action, argument2); // assign script
ds_list_add(_action, _arguments); // assign arguments
ds_list_add(_event, _action); // add action to the event

return _action;

#define TweenOnResumeAdd
/*
    TweenOnResumeAdd(tween, caller, script, -1 or TArgs(arg1, arg2, ...))
    Returns: Handle
*/

var _event = ds_list_find_value(argument0, 17);
var _action = ds_list_create();
var _arguments = argument3;

// create event if it doesn't exists
if (_event == -1)
{
    _event = ds_list_create();
    ds_list_replace(argument0, 17, _event);
}

ds_list_add(_action, argument1); // assign caller
ds_list_add(_action, argument2); // assign script
ds_list_add(_action, _arguments); // assign arguments
ds_list_add(_event, _action); // add action to the event

return _action;

#define TweenOnLoopAdd
/*
    TweenOnLoopAdd(tween, caller, script, -1 or TArgs(arg1, arg2, ...))
    Returns: Handle
*/

var _event = ds_list_find_value(argument0, 18);
var _action = ds_list_create();
var _arguments = argument3;

// create event if it doesn't exists
if (_event == -1)
{
    _event = ds_list_create();
    ds_list_replace(argument0, 18, _event);
}

ds_list_add(_action, argument1); // assign caller
ds_list_add(_action, argument2); // assign script
ds_list_add(_action, _arguments); // assign arguments
ds_list_add(_event, _action); // add action to the event

return _action;

#define TweenOnRepeatAdd
/*
    TweenOnRepeatAdd(tween, caller, script, -1 or TArgs(arg1, arg2, ...))
    Returns: Handle
*/

var _event = ds_list_find_value(argument0, 19);
var _action = ds_list_create();
var _arguments = argument3;

// create event if it doesn't exists
if (_event == -1)
{
    _event = ds_list_create();
    ds_list_replace(argument0, 19, _event);
}

ds_list_add(_action, argument1); // assign caller
ds_list_add(_action, argument2); // assign script
ds_list_add(_action, _arguments); // assign arguments
ds_list_add(_event, _action); // add action to the event

return _action;

#define TweenOnBounceAdd
/*
    TweenOnBounceAdd(tween, caller, script, -1 or TArgs(arg0, arg1, ...))
    Return: Callback Handle
*/

var _event = ds_list_find_value(argument0, 20);
var _action = ds_list_create();
var _arguments = argument3;

// create event if it doesn't exists
if (_event == -1)
{
    _event = ds_list_create();
    ds_list_replace(argument0, 20, _event);
}

ds_list_add(_action, argument1); // assign caller
ds_list_add(_action, argument2); // assign script
ds_list_add(_action, _arguments); // assign arguments
ds_list_add(_event, _action); // add action to the event

return _action;

#define TweenOnPlayRemove
/*
    TweenOnPlayRemove(tween, action)
*/

var _event = ds_list_find_value(argument0, 13);
var _action = argument1;

if (_event != -1)
{
    var _actionIndex = ds_list_find_index(_event, _action);
    if (_actionIndex != -1)
    {
        ds_list_delete(_event, _actionIndex); // remove action from event
        ds_list_destroy(ds_list_find_value(_action, 2)) // destroy action arguments
        ds_list_destroy(_action); // destroy action
        return true;
    }
}

return false;




#define TweenOnFinishRemove
/*
    TweenOnFinishRemove(tween, action)
*/

var _event = ds_list_find_value(argument0, 14);
var _action = argument1;

if (_event != -1)
{
    var _actionIndex = ds_list_find_index(_event, _action);
    if (_actionIndex != -1)
    {
        ds_list_delete(_event, _actionIndex); // remove action from event
        ds_list_destroy(ds_list_find_value(_action, 2)) // destroy action arguments
        ds_list_destroy(_action); // destroy action
        return true;
    }
}

return false;

#define TweenOnStopRemove
/*
    TweenOnStopRemove(tween, action)
*/

var _event = ds_list_find_value(argument0, 15);
var _action = argument1;

if (_event != -1)
{
    var _actionIndex = ds_list_find_index(_event, _action);
    if (_actionIndex != -1)
    {
        ds_list_delete(_event, _actionIndex); // remove action from event
        ds_list_destroy(ds_list_find_value(_action, 2)) // destroy action arguments
        ds_list_destroy(_action); // destroy action
        return true;
    }
}

return false;

#define TweenOnPauseRemove
/*
    TweenOnPauseRemove(tween, action)
*/

var _event = ds_list_find_value(argument0, 16);
var _action = argument1;

if (_event != -1)
{
    var _actionIndex = ds_list_find_index(_event, _action);
    if (_actionIndex != -1)
    {
        ds_list_delete(_event, _actionIndex); // remove action from event
        ds_list_destroy(ds_list_find_value(_action, 2)) // destroy action arguments
        ds_list_destroy(_action); // destroy action
        return true;
    }
}

return false;

#define TweenOnResumeRemove
/*
    TweenOnResumeRemove(tween, action)
*/

var _event = ds_list_find_value(argument0, 17);
var _action = argument1;

if (_event != -1)
{
    var _actionIndex = ds_list_find_index(_event, _action);
    if (_actionIndex != -1)
    {
        ds_list_delete(_event, _actionIndex); // remove action from event
        ds_list_destroy(ds_list_find_value(_action, 2)) // destroy action arguments
        ds_list_destroy(_action); // destroy action
        return true;
    }
}

return false;

#define TweenOnLoopRemove
/*
    TweenOnLoopRemove(tween, action)
*/

var _event = ds_list_find_value(argument0, 18);
var _action = argument1;

if (_event != -1)
{
    var _actionIndex = ds_list_find_index(_event, _action);
    if (_actionIndex != -1)
    {
        ds_list_delete(_event, _actionIndex); // remove action from event
        ds_list_destroy(ds_list_find_value(_action, 2)) // destroy action arguments
        ds_list_destroy(_action); // destroy action
        return true;
    }
}

return false;

#define TweenOnRepeatRemove
/*
    TweenOnRepeatRemove(tween, action)
*/

var _event = ds_list_find_value(argument0, 19);
var _action = argument1;

if (_event != -1)
{
    var _actionIndex = ds_list_find_index(_event, _action);
    if (_actionIndex != -1)
    {
        ds_list_delete(_event, _actionIndex); // remove action from event
        ds_list_destroy(ds_list_find_value(_action, 2)) // destroy action arguments
        ds_list_destroy(_action); // destroy action
        return true;
    }
}

return false;

#define TweenOnBounceRemove
/*
    TweenOnBounceRemove(tween, action)
*/

var _event = ds_list_find_value(argument0, 20);
var _action = argument1;

if (_event != -1)
{
    var _actionIndex = ds_list_find_index(_event, _action);
    if (_actionIndex != -1)
    {
        ds_list_delete(_event, _actionIndex); // remove action from event
        ds_list_destroy(ds_list_find_value(_action, 2)) // destroy action arguments
        ds_list_destroy(_action); // destroy action
        return true;
    }
}

return false;

#define TweenOnPlayRemoveAll
/*
    TweenOnPlayRemoveAll(tween);
*/

var _event = ds_list_find_value(argument0, 13);

if (_event != -1)
{
    repeat(ds_list_size(_event))
    {
        var _action = ds_list_find_value(_event, 0); // fetch action
        ds_list_destroy(ds_list_find_value(_action, 2)); // destroy action arguments
        ds_list_destroy(_action); // destroy action
        ds_list_delete(_event, 0); // remove action from event
    }
}

#define TweenOnFinishRemoveAll
/*
    TweenOnFinishRemoveAll(tween);
*/

var _event = ds_list_find_value(argument0, 14);

if (_event != -1)
{
    repeat(ds_list_size(_event))
    {
        var _action = ds_list_find_value(_event, 0); // fetch action
        ds_list_destroy(ds_list_find_value(_action, 2)); // destroy action arguments
        ds_list_destroy(_action); // destroy action
        ds_list_delete(_event, 0); // remove action from event
    }
}

#define TweenOnStopRemoveAll
/*
    TweenOnStopRemoveAll(tween);
*/

var _event = ds_list_find_value(argument0, 15);

if (_event != -1)
{
    repeat(ds_list_size(_event))
    {
        var _action = ds_list_find_value(_event, 0); // fetch action
        ds_list_destroy(ds_list_find_value(_action, 2)); // destroy action arguments
        ds_list_destroy(_action); // destroy action
        ds_list_delete(_event, 0); // remove action from event
    }
}

#define TweenOnPauseRemoveAll
/*
    TweenOnPauseRemoveAll(tween);
*/

var _event = ds_list_find_value(argument0, 16);

if (_event != -1)
{
    repeat(ds_list_size(_event))
    {
        var _action = ds_list_find_value(_event, 0); // fetch action
        ds_list_destroy(ds_list_find_value(_action, 2)); // destroy action arguments
        ds_list_destroy(_action); // destroy action
        ds_list_delete(_event, 0); // remove action from event
    }
}

#define TweenOnResumeRemoveAll
/*
    TweenOnResumeRemoveAll(tween);
*/

var _event = ds_list_find_value(argument0, 17);

if (_event != -1)
{
    repeat(ds_list_size(_event))
    {
        var _action = ds_list_find_value(_event, 0); // fetch action
        ds_list_destroy(ds_list_find_value(_action, 2)); // destroy action arguments
        ds_list_destroy(_action); // destroy action
        ds_list_delete(_event, 0); // remove action from event
    }
}

#define TweenOnLoopRemoveAll
/*
    TweenOnLoopRemoveAll(tween);
*/

var _event = ds_list_find_value(argument0, 18);

if (_event != -1)
{
    repeat(ds_list_size(_event))
    {
        var _action = ds_list_find_value(_event, 0); // fetch action
        ds_list_destroy(ds_list_find_value(_action, 2)); // destroy action arguments
        ds_list_destroy(_action); // destroy action
        ds_list_delete(_event, 0); // remove action from event
    }
}

#define TweenOnRepeatRemoveAll
/*
    TweenOnRepeatRemoveAll(tween);
*/

var _event = ds_list_find_value(argument0, 19);

if (_event != -1)
{
    repeat(ds_list_size(_event))
    {
        var _action = ds_list_find_value(_event, 0); // fetch action
        ds_list_destroy(ds_list_find_value(_action, 2)); // destroy action arguments
        ds_list_destroy(_action); // destroy action
        ds_list_delete(_event, 0); // remove action from event
    }
}

#define TweenOnBounceRemoveAll
/*
    TweenOnBounceRemoveAll(tween);
*/

var _event = ds_list_find_value(argument0, 20);

if (_event != -1)
{
    repeat(ds_list_size(_event))
    {
        var _action = ds_list_find_value(_event, 0); // fetch action
        ds_list_destroy(ds_list_find_value(_action, 2)); // destroy action arguments
        ds_list_destroy(_action); // destroy action
        ds_list_delete(_event, 0); // remove action from event
    }
}

