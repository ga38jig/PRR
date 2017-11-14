% This is the script format. Unlike functions, you can just run scrips
% without any arguments and outputs.


%% Matlab in general

%Matlab is an IDE gives you a text editor, a file viewer, a console to call
%your functions and run code, a workspace that defines variables and many
%more.Matlab is an abbreviation for matrix labarotory, since it is made 
%especially for fast vectories and matrix formed calculations.
%It has it's own high level language, which means you do not have to
%worry about memory allocation, variable type decleration and similar
%things that were essential in low level languages like c++. One of the
%most details in matlab is that matrix dimensions and arrays start with '1'
%instead of '0'.

%Please try to copy paste to run parts that are not clear to you. Also do
%not be afraid to experiment. If you want to run a function, make sure it
%is in the path to matlab. You can ensure that by finding the file in the
%file explorer and right clicking and choosing add to path.

%% Matlab scalar variables

%In matlab every variable is by default of type double. You do not have to
%declare variables before assigning them.

x = 5;

% The semicolon here is used for the console to not to show the result as
% opposed to C where it was to mark the end to a statement. It is not
% obligatory for the code to run.

y = x+1;
y = x-1;
y = x*2;
y = x/2;
y = x^5;

% The operations work straightforwardly for scalars. Be carefull as the
% shortcuts x++ or x-- are not defined here. The '^' operator is the power.

%% Matlab vectors
v1 = [1,2,3,4];
v1 = [1 2 3 4];
v2 = [5;6;7;8];

% Vectors are 1D arrays in matlab.Basic vector definitions require squared braces. A comma or space
% between the elements suggest moving to the next column, whereas a
% semicolon suggest moving to the next row. So while you get a row vector
% with v1, you get a column vector with v2.

v3 = v1+v1;
v3 = v1-v1;
v3 = v1*2;
v3 = v1/2;



% The addition and subtraction operators are defined on vectors of the
% same size and are done elementwise. Same with multiplying or dividing by
% scalars

v3 = v1 - 2;
v3 = v1  +3;
% In the recent versions of matlab, you can use addition and subtraction of
% vectors with scalars. This was not used to be the case. This operation
% first creates an equalsized vector made out of the scalar, and then
% performs the operation

x1 = v1*v2;

% '*' sign is reserved to vector multiplication primarily. So it has to be
% done with a mxn vector and a nxp vector otherwise you will get an error.

v4 = v1.*v1;
v4 = v1./v1;

% If you want elementwise multiplication or division of vectors the correct
% operators are '.*' and './'.

v5 = v1';

% the ' operator gives you the transpose of a vector or matrix.

v1(2) = 2;
v2(3) = v2(1);
% to access the indexes of a vector or matrix you should use paranthesis.
% The first  operation above replaces the value in the second index of v1
% with the number 2. The second operation replaces the value in the second
% index of v2 with the value that is in the 1st index of v2.

v3 = [1:4];
v3 = [1:1:4];
v4 = [1:2.4:10];
v5 = [5:-1:2];

% An other way to create vectors is with the colon operator. [a:b:c]
% creates a row vector that starts with a, has the stepsize b and ends with
% c. So it has the length floor((a-c)/b). The stepsize can be negative or non
% float. Note that if there is no stepsize given, it is taken as 1 by
% default, like in the first declaration.

v3 = linspace(1,4,4);
v4 = linspace(10,1,4);

% An alternative way of creating a vector is with the linspace function.
% The functions takes arguments in paranthesis seperated by commas. The
% input can be a scalar, vector, matrix or even objects. linspace(a,b,c) 
% creates a vector starting with a, ending with b and divided into c-1 equal
% pieces. a must not be greater than b but c has to be a unsigned integer.

v1(1:3) = 0;
v2([1,2,4]) = 0;
v4(1:2:8) = 0;

% You can also assign multiple indexes of a vector the same value, by
% giiving a vector inside the paranthesis, as list of the indexes
%% Matlab matrices

% Most of the stuff defined in vectors directly apply to matrices.
% Matrices are written with capital letters by convention. Matrices are 2D
% arrays in matlab.

M1 = [1,2,3;
    4,5,6;
    7,8,9];
M2 = [4,5,2;8,9,0];
M3 = [7 2; 5 1; 9 6];

% While declaring matrices you have to declare each row in order and put a
% semicolon between them. The rows have to be in the same length.

A = M1+M1;
A = M1-M1;
A = M1*2;
A = M1/2;
A = M1 -1;
A = M1 +3;

%The basic operations are analogous to the vectors.

A = M1*M1;
B = M2*M3;
C = M2'*M3';

% Multiplication operator '*' defines a matrix multiplication which
% requires matching dimensions, mxn and nxp.

A = M1.*M1;
A = M2./M2;

% To do elementwise operations you must add '.' before the operator.

v1 = [1:3]; 
v2 = [1:3]';
A = M1 - v1;
A = M1 + v2;

%Again in the recent versions of matlab, you can define non elementwise
%addition and s?btraction between matrices and vectors. For this one
%dimension of the vector has to be the same with the matrix. Matlab
%automatically creates a matrix in equal dimensions by copying the vector,
%and then does the operation

M1 = M1';
A = inv(M1);
B = pinv(M2);

%The ' operator takes the transpose of a matrix. The inv() function outputs
%the inverse of the matrix and pinv() function takes the moore-penrose
%pseudoinverse.

A = M1\M3;

% The backslash operator actually does a very interesting fast calculation.
% A\B calculates pinv(A)*B, which is the solution of the linear equation
% system A*X = B.

M1(1,2) = 1;
M1(1:2,2) = 0;
M1(:,2:3) = M1(1:3,[1,3]);

% You can access the indexes of the matrices with paranthesis and two
% inputs. The first input determines the row numbers and the second one
% determines the column number. Them matlab accesses every value in the
% overlap on the row and column lists and changes them. The : operator
% alone means create a list as big as the element size. So for a mxn matrix
% M, M(:,:) is equal to M(1:m,1:n).

M1(4) = 4;

%You can also access matrix elements directly with one index. This first
%creates a 1D array from the matrix, by placing all columns under each
%other starting from the first column. v = M1(:). Then the index you give
%corresponds to the index of that list.


%% Logicals

bool1 = 0>1;
bool2 = 9<=9;
bool3 = [1:5]~=[1:5];

% The logical variables, that are the equavalent of booleans in C. 
% They give an output of logical 0 or logical 1. However they do not have
% to be scalars and can be n dimentional arrays. The unequal sign is '~='.

truth = bool1 && bool2;
truth = (bool1 || bool2) & bool3;

% The operators 'and' '&&' and 'or' '||' have to be applied to scalars,
% while you can use '&' and '|' for arrays.

A = rand(1,16); 
A = reshape(A,4,4);

I = A<0.5;
A(I) = 0;

A( A == 0) = 5;

%Now for the use of logicals in array indexing. In the first statement, we
%make a 16x1 vector of random numbers between 0 and 1. Then we change the
%shape of it using  the reshape function to a 4 by 4 matrix. Afterwards we
%get a logical 4x4 matrix which is logical 1 for the indexes where elements of A
%is smaller than 0.5 and logical 0 everywhere else. If we give this list to
%A(), we get the elements of A  in the indexes where I is logical 1. So we
%get the elements of a smaller than 0.5. Then we change the value in these indexes to 0.
%In the last line, we show that the same thing can be done shorter. We can
%change the elements of A that are 0 to zero to 5.

%% Loops and conditionals
x = 1;
if x < 4
    x = 5;
else 
    x = 1;
end

% If statements are like the above. Note that after if a logical scalar
% must come and the clause has to be finished by end

for i = 1:2:10
    S = strcat('Iteration count: ',num2str(i));
    disp(S);
    
end

% A for statement takes a variable as input and iterates every element of
% that variable. It also has to end with end.

for i = 1:1000
    
    Dont(1:3,i) = [0.01*i,0.02*i,0.03i]'; 
    
end

Do = zeros(3,1000);
for i = 1:1000
    
    Do(1:3,i) = [0.01*i,0.02*i,0.03i]'; 
    
end

% Always, always initialize your matrices first. Having matrices that
% change dimensions within a loop is very very inefficient and one of the
% worst practices you can do in Matlab

%% Usefull functions

A = zeros(4);
A = ones(3,4);
A = eye(2);
A = zeros(2,3,4);
A = diag([1:4]);
A = rand();
% These are the main functions to initialize functions in matlab. Zeros
% makes an array of arbitrary dimensions with values zero. Ones makes the
% same thing but initializes them with one. Eye function makes a quadratic
% identity matrix. Note that there can be more then 2 dimensions. Diag
% creates a square matrix that has the index array on the diagonals.
% Rand function gives you a random rational number between 1 and 0.

s = sin(pi/2);
c = cos(0);
theta = atan2(s,c);
% Sin and cos are defined straightforward and by default takes radiant
% inputs. The atan2 funtction calculates the arctan of an angle. It should
% be the way for all angle extraction calculations.

[row, col] = size(A);
[row] = size(A,1);
[col] = size(A,2);

% size() is a very usefull function in matlab to get the size of matrices
% and vectors.

figure('Name','My_2d_fig');
plot([1:4],[1:4],'k', 'MarkerSize', 12);
xlabel('x');
ylabel('y');
hold on
plot([1:4],[4:-1:1],'d','MarkerFaceColor','b');
hold off

% Ploting takes the x and y coordinates and then spesifications about the 
% plot as input. Here first a figure is defines with the title 'My_2d_fig'
% and it is the window that your plot will appear in. In first plot() the x and y
% coordinates are given, followed by the color code and size of the
% markers. By default plot draws a line if it receives a vector, if you want to avoid it, use the
% 'd' argument directly after the last coordinate. The xlabel and ylabel
% functions allows you to define the axis labels. By default the plot
% function rewrites the last plot, so after defining a figure we use the 'hold
% on' function so the second plot is also shown in the same cartesian
% coordinates.

figure('Name','My_3d_fig');
hold on
for  i = 1:4
plot3(i,2*i,4+i,'*','MarkerSize', 20, 'MarkerEdgeColor','r');
end
hold off
% You can also do a 3d plot with plot3. The only thing that is different
% here is that you have to give 3 coordinates.

x = 5;
string = num2str(x);
string = strcat('number is:',string);
disp(string);

string = '523';
x = str2double(string);

% you can switch from strings to numbers with the str2double and num2str
% functions. strcat(), short for string concanatate allows you to merge
% strings.


% Most important of the all is the help function. Just write 'help'
% followed by space and the function or operator you want to learn more
% about. Try it with rand().
%% Function Definitions

% You can define functions as standalone files, by right click>new
% File>Function or in a script. However the functions you define in a
% script will only be accessible by name within th script and not in the
% command window. If you define the functions as files, you will be able to
% call them by name from the command window
% The functions can have any number of inputs and outputs of any type.

[a,A] = myfunc(5,[1:5],ones(5));

%To call a function it needs to be in the matlab path or at the end of the
%script. 

[~,A] = myfunc(5,[1:5],ones(5));

%To ignore an output just put tilde sign instead.

function [out1,out2] = myfunc(scalar,vector,matrix)

 out1 = scalar*sum(vector);
 
 out2 = matrix/scalar;
end

%You need to end the function with end.
%For any further questions just google matlab intorductions and follow the
%introductions made by mathworks. You can also just google any spesific
%question as matlab is very well documented.

