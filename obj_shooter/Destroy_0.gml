//Se livre da bala
if instance_exists (bulletInst) && bulletInst.state == 0
{
  bulletInst.destroy = true;	
}
