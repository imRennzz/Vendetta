if audio_is_playing(snd_gamemusic2)

{
   audio_stop_sound(snd_gamemusic2)

   if !audio_is_playing(snd_vento)
{
	audio_play_sound(snd_vento, 20, true);
}

}


