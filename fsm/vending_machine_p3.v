module vending_machine_p3 (
    input           clk,
    input           rstn,
    input  [1:0]    coin,

    output [1:0]    change,
    output          sell
);
    parameter idle  = 3'd0;
    parameter get05 = 3'd1;
    parameter get10 = 3'd2;
    parameter get15 = 3'd3;

    reg [2:0]   st_next;
    reg [2:0]   st_cur;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            st_cur <= 3'b0;
        end

        else begin
            st_cur <= st_next;
        end
    end

    always @(*) begin
        case (st_cur)
            idle:
                case (coin)
                    2'd01 : st_next = get05;
                    2'd10 : st_next = get10; 
                    default: st_next = idle;
                endcase
            get05:
                case (coin)
                    2'd01 : st_next = get10;
                    2'd10 : st_next = get15; 
                    default: st_next = get05;
                endcase
            get10:
                case (coin)
                    2'b01, 2'b10 : st_next = idle; 
                    default: st_next = get15;
                endcase
            
            default: st_next = idle;
        endcase
    end

    reg [1:0]   change_r;
    reg         sell_r;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            change_r    <= 2'd0;
            sell_r      <= 1'd0;
        end

        else if ((st_cur==get15 && coin==2'd1) || (st_cur==get10 && coin==2'd2)) begin
            change_r    <= 2'd0;
            sell_r      <= 1'd1; 
        end

        else if (st_cur == get15 && coin == 2'h2) begin
            change_r    <= 2'd1;
            sell_r      <= 1'd1;
        end 

        else begin
            change_r    <= 2'd0;
            sell_r      <= 1'd0; 
        end
        
    end

    assign  sell    = sell_r;
    assign  change  = change_r;

endmodule