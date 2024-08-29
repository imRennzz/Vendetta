if createdDamagedObjects= false

{
	
  damageInst = instance_create_depth (x,y,0,obj_danotodo);
  with (damageInst)
	{
		damage = other.damage;
	    mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	
	
	createdDamagedObjects = true;
	
}

if image_index >= 2
{
  if instance_exists (damageInst)
  {
	  instance_destroy (damageInst);  
  }
  
}