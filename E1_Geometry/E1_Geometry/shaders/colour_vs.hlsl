// colour vertex shader
// Simple geometry pass
// texture coordinates and normals will be ignored.

cbuffer MatrixBuffer : register(b0)
{
	matrix worldMatrix;
	matrix viewMatrix;
	matrix projectionMatrix;
};

struct InputType
{
    float4 position : POSITION;
    float2 uv : TEXCOORD;
};

struct OutputType
{
	float4 position : SV_POSITION;
    float2 uv : TEXCOORD;
};

OutputType main(InputType input)
{
	OutputType output;
	
	// Change the position vector to be 4 units for proper matrix calculations.
	//input.position.w = 1.0f;
    input.position.w = 0.5f;
	
	// Calculate the position of the vertex against the world, view, and projection matrices.
	output.position = mul(input.position, worldMatrix);
	output.position = mul(output.position, viewMatrix);
	output.position = mul(output.position, projectionMatrix);
	
    //output.position = mul(input.position, 2.0f); // Twice original size

    output.uv = input.uv;
	

	return output;
}