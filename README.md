# Example Nitrogen PES
Examples of how to compile, load and call nitrogen, binary and trimer potentials. 


## Linking to precompiled libraries (gfortran)
This approach expects the libraries from the repos:

- https://github.com/RichGraham/2N2_PES
- https://github.com/RichGraham/RichGraham/3N2_PES/direct\_model

to be precompiled and available to the linker (assumed to be in ~/.rsg_libs). These are private repo - if you need access, contact Richard.Graham@nottingham.ac.uk.

### Compile
From the repo folder, run
 
	make
	

### Run the programme
After compiling run
	
	./a.out 
	
This should produce some friendly screen output that evaluates the various potential energy surfaces, and that allows you to confirm that the values are as expected. 

## Direct compilation of all sources (allows any compiler / optimisation flags)
To be added. 

