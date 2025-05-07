__kernel void matrixMul(
    __global const float* input_tile,       
    __global const float* weights_tile,      
    const int input_tile_size,
    const int output_neurons_tile_size,
    __global float* output_tile              
) {
    int neuron_id = get_global_id(0);

    if (neuron_id < output_neurons_tile_size) {
        float result = 0.0f;
        for (int i = 0; i < input_tile_size; i++) {
            result += input_tile[i] * weights_tile[neuron_id * input_tile_size + i];
        }
        output_tile[neuron_id] += result;
    }
}
