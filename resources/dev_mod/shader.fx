//(c) by devGaming (http://devgaming.pl/)

texture DevTexture;

technique applyDevTexture
{
	pass P0
	{
		Texture[0] = DevTexture;
		LightEnable[1] = false;
        LightEnable[2] = false;
        LightEnable[3] = false;
        LightEnable[4] = false;
	}
}