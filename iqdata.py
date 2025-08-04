# Converts space-separated IQ float data to Verilog hex format
# Output is 16-bit hex: {I[7:0], Q[7:0]}

input_file = r"C:\Users\prana\Desktop\radar\3m_R_1.txt"   # Your original IQ file
output_file = "iq_data.hex"     # Verilog memory file

scale = 128  # Adjust this as needed (e.g., 128 for -1 to +1 range)

def float_to_int8(x):
    val = int(round(x * scale))
    return max(-128, min(127, val))  # Clip to int8 range

with open(input_file, "r", encoding="utf-8") as fin, open(output_file, "w") as fout:

    for line in fin:
        if line.strip() == "":
            continue  # skip empty lines
        parts = line.strip().split()
        if len(parts) != 2:
            continue  # skip malformed lines

        try:
            i_f = float(parts[0])
            q_f = float(parts[1])

            i = float_to_int8(i_f) & 0xFF  # 2's complement 8-bit
            q = float_to_int8(q_f) & 0xFF

            word = (i << 8) | q  # Combine into 16-bit word: {I, Q}
            fout.write(f"{word:04X}\n")
        except ValueError:
            continue  # skip non-numeric lines
