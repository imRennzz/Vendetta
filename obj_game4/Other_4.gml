if audio_is_playing(snd_vento)

{
   audio_stop_sound(snd_vento)

   if !audio_is_playing(snd_boss)
{
	audio_play_sound(snd_boss, 20, true);
}

}


