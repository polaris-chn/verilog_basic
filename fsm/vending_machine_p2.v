module vending_machine_p2 (
    input           clk,
    input           rstn,
    input [1:0]     coin,

    output reg      sell,
    output reg      change
);

    parameter idle  = 2'b00;
    parameter get05 = 2'b01;
    parameter get10 = 2'b10;
    parameter get15 = 2'b11;

    reg [1:0] st_cur;
    reg [1:0] st_next;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            st_cur  <= idle; 
        end

        else begin
            st_cur  <= st_next;
        end
        
    end

    reg change_r;
    reg sell_r;
    always @(posedge clk or negedge rstn) begin
        case (st_cur)
            idle:begin
                change_r = 0;
                sell_r   = 0;
                case (coin)
                    2'b01 : st_next = get05;
                    2'b10 : st_next = get10; 
                    default: st_next = idle;
                endcase
            end
                
            get05:begin
                case (coin)
                    2'b01 : st_next = get10;
                    2'b10 : st_next = get15; 
                    default: st_next = get05;
                endcase
            end
                
            get10:begin
                case (coin)
                    2'b01 : begin
                        st_next = get15;
                        change_r = 0;
                        sell_r   = 0;
                    end
                    2'b10 : begin
                        st_next = idle;
                        change_r = 0;
                        sell_r   = 1;
                    end 
                    default: begin
                        st_next = get10;
                        change_r = 0;
                        sell_r   = 0;
                    end
                endcase
            end
                
            get15:
                case (coin) 
                    2'b01 : begin
                        st_next = idle;
                        change_r = 0;
                        sell_r   = 0;
                    end
                    2'b10 : begin
                        st_next = idle; 
                        change_r = 1;
                        sell_r   = 1;
                    end
                    default: begin
                        st_next = get15;
                        change_r = 0;
                        sell_r   = 0;
                    end
                endcase

            default: begin
                st_next = idle;
                change_r = 0;
                sell_r   = 0;
            end
        endcase

    end

    assign change = change_r;
    assign sell   = sell_r;
    
endmodule