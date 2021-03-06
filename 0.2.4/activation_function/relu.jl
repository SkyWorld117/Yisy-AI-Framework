using .Threads

module ReLU
    function opt_diff(value)
        return value>0 ? 1 : 0
    end

    function func(value_matrix::Array{Float32})
        output_matrix = zeros(Float32, size(value_matrix))
        Threads.@threads for i in eachindex(output_matrix)
            output_matrix[i] = max(value_matrix[i], 0)
        end
        return output_matrix
    end

    function diff(inputs::Array{Float32}, position::Int64)
        derivative_vector = zeros(Float32, size(inputs))
        derivative_vector[position] = opt_diff(inputs[position])
        return derivative_vector
    end

    function get_name()
        return "ReLU"
    end
end
