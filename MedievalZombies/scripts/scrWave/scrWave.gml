// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrWave(from, to, duration, offset){
/// @desc wave(from, to, duration, offset)
/// @arg from
/// @arg to
/// @arg duration
/// @arg offset
	var _wave = (to - from) * 0.5;

	return from + _wave + sin((((current_time * 0.001) + duration * offset) / duration) * (pi * 2)) * _wave;
}