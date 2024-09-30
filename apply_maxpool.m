% Author: Jasmin Khan
% This function applies max pooling to the input image, reducing its size by taking the maximum value from non-overlapping 2x2 blocks.

function outarray =apply_maxpool(inarray)
% innary is the input is an array of the size 2N × 2M × D and the output is an array of the size N × M × D

 [i_rows, i_cols, depth] = size(inarray);
 o_rows= i_rows / 2;
 o_cols= i_cols / 2;

 for k = 1:depth % Looping over the output rows and columns i and j
        for i = 1:o_rows
            for j = 1:o_cols
                %2x2 block in the input array
                row_start = 2 * i - 1;
                row_end = row_start + 1;
                co_start = 2 * j - 1;
                co_end = co_start + 1;
                
                % 2x2 block from the input
                block = inarray(row_start:row_end, co_start:co_end, k);
                
                %maximum value of the block to the outputarray
                outarray(i, j, k) = max(block(:));
             end
         end
 end 
end
