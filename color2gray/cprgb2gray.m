function gIm = cprgb2gray(im)
	% input 'im' is a color image
	% output gIm is the resulting grayscale image

	% TODO: Convert the input to LAB space

	% TODO: Construct delta_xy for each neighboring pixels

	% TODO: Constructing A and Delta

	% TODO: Solve the objective function to get G

	% Normalization and output gIm
	gIm = (gIm - min(gIm(:)))/ (max(gIm(:)) - min(gIm(:)));

end

