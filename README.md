# Bi-Level Image Context Select  Coder

The following Matlab code implements a lossless bi-level image encoder and decoder.

Detailed discussion and performance results are presented on the paper. 
If you find this code useful in your own research, please consider citing:

    @inproceedings{evaristo2020,
	    Author = {Evaristo Ramalho and Eduardo Peixoto},
	    Title = {Context Selection for Lossless Compression of Bi-Level Images},
	    Booktitle  = {XXXVIII SIMPÓSIO BRASILEIRO DE TELECOMUNICAÇÕES E PROCESSAMENTO DE SINAIS (SBrT2020)},
	    Year = {2020}
    }

# LICENSE
Copyright 2020 Evaristo Ramalho

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Usage
To execute the code, you need first to run the script `startup`, which adds the project to your Matlab Path.

Afterwards, there are the 3 main functions and script that can be used:
- The function
    `contextVector = generateContextVector(img)`
	takes one input, the binary image and returns the context vector to be used.

- The function
    `tbpp = encodeImage(img, contextVector, outputFile)`
	takes three inputs, the binary image, the context vector and the output bin file name that will contain the compressed image.
	It encodes the data, writing the compressed image with the header in the outputFile, and returns the rate in bpp.
  
  Obs: This function also could use a number in the second input from 1 to 16, indicating how many contexts will be used, considering the JBIG order.

- The function
    `img_dec = decodeImage(outputFile,reconstructedImage)`
	takes two inputs, the binary compressed image file and the name of the decoded image
	It decodes the data, returning the array image and saving the image with the reconstructedImage name

- The script file in the v0 folder, executes all 3 functions above.


# Contact Person
[Evaristo Ramalho](mailto:evaristo.ramalho@aluno.unb.br)
