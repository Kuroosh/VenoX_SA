texture texture1;
sampler texturesampler = sampler_state{Texture = (texture1);};
float cont;
float progress;

float4 PixelShaderFunction(float2 TexCoord: TEXCOORD0) : COLOR0
{

    float4 texturesamplercolor = tex2D(texturesampler, TexCoord);
	float4 wbsampler = (0,0,0,1);
	float4 finalcolor = (0,0,0,1);
	
	float value = (pow(texturesamplercolor.r,cont)+pow(texturesamplercolor.g,cont)+pow(texturesamplercolor.b,cont))/3;
	wbsampler.r = value;
	wbsampler.g = value;
	wbsampler.b = value;
	
	finalcolor.r = lerp(texturesamplercolor.r,wbsampler.r,progress/100);
	finalcolor.g = lerp(texturesamplercolor.g,wbsampler.g,progress/100);
	finalcolor.b = lerp(texturesamplercolor.b,wbsampler.b,progress/100);
	
    return finalcolor;
}





technique bw
{
    pass P0
    {
        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}

// Fallback
technique fallback
{
    pass P0
    {
        // Just draw normally
    }
}