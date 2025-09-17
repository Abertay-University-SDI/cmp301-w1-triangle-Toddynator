// Colour pixel/fragment shader
// Basic fragment shader outputting a colour

struct InputType
{
	float4 position : SV_POSITION;
    float2 uv : TEXCOORD;
};


float4 main(InputType input) : SV_TARGET
{
    //return float4(1.0f, 0.0f, 0.0f, 1.0f); // Overwrite colour
    return float4(input.uv.y, input.uv.y, input.uv.y, 1.0f);
}