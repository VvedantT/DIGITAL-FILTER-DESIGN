# DIGITAL-FILTER-DESIGN

*COMPANY *  :CODTECH IT SOLUTIONS
*NAME*      :VEDANT DARJI
*INTERN ID* :CT08DN1242
*DOMAIN*    :VLSI
*DURATION*  :8 WEEKS
*MENTOR*    :NEELA SANTOSH

An FIR filter is a type of digital filter where the output is a weighted sum of current and previous input samples. The key features in this design include:

Inputs:
clk: Clock signal for synchronous operations.
reset: Resets internal states of the filter.
x: Input data sample (typically a digital signal).

Output:
y: Filtered output sample.

Parameters & Design:
The filter uses a fixed set of coefficients (also known as taps) that define the impulse response.
On every clock cycle, a new input is accepted and processed.
A shift-register approach is used to store recent input samples.
A multiply-accumulate structure performs the dot product of stored inputs and coefficients to produce the output.

The testbench includes:
Instantiation of the FIR filter module with proper signal connections.

Stimulus generation:
Clock and reset signals are generated internally.
A sequence of input samples (x) is applied to the filter.
Edge cases such as reset behavior and varying input conditions are tested.

Monitoring and Display:
Outputs such as input samples, output values, and time stamps may be printed using $display or similar system tasks.
Helps in verifying if the filter response is as expected for a given input sequence.

<img width="855" height="636" alt="Image" src="https://github.com/user-attachments/assets/10511ed1-6b1e-4626-b635-29bc4fa5ef1e" />
<img width="1593" height="819" alt="Image" src="https://github.com/user-attachments/assets/219cf0b3-8cd7-40c8-8142-052cc0409a45" />
<img width="1580" height="819" alt="Image" src="https://github.com/user-attachments/assets/2200eb00-e7b2-45e9-8693-5a6f821ed4c3" />
