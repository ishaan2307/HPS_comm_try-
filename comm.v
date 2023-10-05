module memory_mapped_register (
    input wire clk,             // Clock input
    input wire rst,             // Reset input
    input wire write_enable,    // Write enable input
    input wire [31:0] data_in,  // Data input
    output reg [31:0] reg_data  // Memory-mapped register
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg_data <= 32'h00000000; // Reset the register to 0
        end else if (write_enable) begin
            reg_data <= data_in;      // Write data to the register when write_enable is asserted
        end
        // No else condition, so register retains its value if write_enable is not asserted
    end

endmodule
