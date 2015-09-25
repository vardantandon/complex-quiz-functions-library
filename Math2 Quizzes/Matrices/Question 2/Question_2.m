%Matrices Question 2 - Matching types of matrices
%Authored By: Vardan Tandon under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('Question_2.xml','w'); 

%xml initialization code
fprintf(file, quiz_start()); 

for i=1:1:100

%Calculations
x = [1,-1,-1];
pos = randi(length(x));
pos_1 = randi(length(x));
num = x(pos);
num_1 = x(pos_1);
a = randi([1 20],1,1)*num;
b = randi ([1 20],1,1)*num_1;
c = randi([1 20],1,1)*num_1;
d = randi ([1 20],1,1)*num;
e = randi([1 20],1,1)*num_1;
f = randi ([1 20],1,1)*num;
g = randi([1 20],1,1)*num_1;
h = randi ([1 20],1,1)*num;
i_1 = randi ([1 20],1,1)*num;
j = randi([1 20],1,1)*num_1;
k = randi ([1 20],1,1)*num;
l = randi([1 20],1,1)*num;
m = randi ([1 20],1,1)*num_1;
n = randi([1 20],1,1)*num;
o = randi ([1 20],1,1)*num;
p = randi([1 20],1,1)*num_1;
q = randi ([1 20],1,1)*num_1;
r = randi ([1 20],1,1)*num;
s = randi([1 20],1,1)*num_1;
t = randi ([1 20],1,1)*num;
u = randi([1 20],1,1)*num;
v = randi ([1 20],1,1)*num_1;
w = randi([1 20],1,1)*num;
x = randi ([1 20],1,1)*num;
y = randi([1 20],1,1)*num_1;
z = randi ([1 20],1,1)*num_1;



A = [a,b,c;b,d,e;c,e,f] ; %symmetric
B = [0,k,l;-k,0,o;-l,-o,0]; %skew-symmetric
C = [r,0,0;0,q,0;0,0,i_1]; %diagnol
D = [s,t,u;0,v,w;0,0,x]; %UT
E = [y,0,0;z,g,0;e,l,j];%LT
F = [0,c,p;0,0,k;0,0,0]; %SUT
G = [0,0,0;i_1,0,0;w,v,0];%SLT

%Feedback string joining
feedbackString = strcat('<b>Symmetric Matrix</b> : A symmetric matrix is a square matrix which is symmetric about its leading diagonal (top left to bottom right).In other words the transpose of the matrix equals the matrix itself. <br><br>',...
'<b>Skew Symmetric Matrix</b> : A skew symmetric matrix is a square matrix in which the leading diagonal entries equal to 0 and it follows the rule a<sub>ij</sub> = -a<sub>ji</sub>.In other words the negative transpose of the matrix equals the matrix itself. <br><br>',...
'<b>Diagonal Matrix</b> : A diagonal matrix is a square matrix in which all entries other than the leading diagonal equal to 0. The leading diagonal entries may or may not be 0.<br><br>',...
'<b>Upper Triangular Matrix</b> : An upper triangular matrix is a square matrix in which all entries below the leading diagonal are 0.<br><br> ',...
'<b>Lower Triangular Matrix</b> : A lower triangular matrix is a square matrix in which all entries above the leading diagonal are 0.<br><br> ',...
'<b>Strictly Upper Triangular Matrix</b> : A strictly upper triangular matrix is an upper triangular matrix in which the leading diagonal entries equal to 0.<br><br> ',...
'<b>Strictly Lower Triangular Matrix</b> : A strictly lower triangular matrix is a lower triangular matrix in which the leading diagonal entries equal to 0.<br><br> ');

%Match Type question format
fprintf(file,'  <!-- question: %i  -->', i);
    fprintf(file,'\n  <question type="matching">');
    fprintf(file,'\n    <name>');
    fprintf(file,'\n      <text>Types of Matrix</text>');
    fprintf(file,'\n    </name>');
    fprintf(file,'\n    <questiontext format="html">');
    fprintf(file,'\n      <text><![CDATA[<p>Match the following matrices with their appropriate types :  </p>]]></text>');
    fprintf(file,'\n    </questiontext>');
    fprintf(file,'\n    <generalfeedback format="html">');
    fprintf(file,'\n      <text><![CDATA[<p>%s</p>]]></text>',feedbackString);
    fprintf(file,'\n    </generalfeedback>');
    fprintf(file,'\n    <defaultgrade>1.0000000</defaultgrade>');
    fprintf(file,'\n    <penalty>0.3333333</penalty>');
    fprintf(file,'\n    <hidden>0</hidden>');
    fprintf(file,'\n <subquestion>');
    fprintf(file,'\n<text><![CDATA[<p>$$\\small \\begin{pmatrix}%i & %i & %i \\\\%i & %i & %i \\\\%i & %i & %i\\end{pmatrix}\\:$$</p>]]></text>',a,b,c,b,d,e,c,e,f);
    fprintf(file,'\n <answer>');
    fprintf(file,'\n   <text><![CDATA[<p> Symmetric Matrix</p>]]></text>');
    fprintf(file,'\n </answer>');
    fprintf(file,'\n </subquestion>');
    fprintf(file,'\n <subquestion>');
    fprintf(file,'\n <text><![CDATA[<p>$$\\small \\begin{pmatrix}%i & %i & %i \\\\%i & %i & %i \\\\%i & %i & %i\\end{pmatrix}\\:$$</p>]]></text>',j,k,l,-k,n,o,-l,-o,p);
    fprintf(file,'\n <answer>');
    fprintf(file,'\n <text><![CDATA[<p>Skew Symmetric Matrix</p>]]></text>');
    fprintf(file,'\n </answer>');
    fprintf(file,'\n </subquestion>');
    fprintf(file,'\n <subquestion>');
    fprintf(file,'\n <text><![CDATA[<p>$$\\small \\begin{pmatrix}%i & 0 & 0 \\\\0 & %i & 0 \\\\0 & 0 & %i\\end{pmatrix}\\:$$</p>]]></text>',r,q,i_1);
    fprintf(file,'\n <answer>');
    fprintf(file,'\n <text><![CDATA[<p>Diagonal Matrix</p>]]></text>');
    fprintf(file,'\n </answer>');
    fprintf(file,'\n </subquestion>');
    fprintf(file,'\n <subquestion>');
    fprintf(file,'\n <text><![CDATA[<p>$$\\small \\begin{pmatrix}%i & %i & %i \\\\0 & %i & %i \\\\0 & 0 & %i\\end{pmatrix}\\:$$</p>]]></text>',s,t,u,v,w,x);
    fprintf(file,'\n <answer>');
    fprintf(file,'\n <text><![CDATA[<p>Upper Triangular Matrix</p>]]></text>');
    fprintf(file,'\n </answer>');
    fprintf(file,'\n </subquestion>');
    fprintf(file,'\n <subquestion>');
    fprintf(file,'\n <text><![CDATA[<p>$$\\small \\begin{pmatrix}%i & 0 & 0 \\\\%i & %i & 0 \\\\%i & %i & %i\\end{pmatrix}\\:$$</p>]]></text>',y,z,g,e,l,j);
    fprintf(file,'\n <answer>');
    fprintf(file,'\n <text><![CDATA[<p>Lower Triangular Matrix</p>]]></text>');
    fprintf(file,'\n </answer>');
    fprintf(file,'\n </subquestion>');
    fprintf(file,'\n <subquestion>');
    fprintf(file,'\n <text><![CDATA[<p>$$\\small \\begin{pmatrix}0 & %i & %i \\\\0 & 0 & %i \\\\0 & 0 & 0\\end{pmatrix}\\:$$</p>]]></text>',c,p,k);
    fprintf(file,'\n <answer>');
    fprintf(file,'\n <text><![CDATA[<p>Strictly Upper Triangular Matrix</p>]]></text>');
    fprintf(file,'\n </answer>');
    fprintf(file,'\n </subquestion>');
    fprintf(file,'\n <subquestion>');
    fprintf(file,'\n <text><![CDATA[<p>$$\\small \\begin{pmatrix}0 & 0 & 0 \\\\%i & 0 & 0 \\\\%i & %i & 0\\end{pmatrix}\\:$$</p>]]></text>',i_1,w,v);
    fprintf(file,'\n <answer>');
    fprintf(file,'\n <text><![CDATA[<p>Strictly Lower Triangular Matrix</p>]]></text>');
    fprintf(file,'\n </answer>');
    fprintf(file,'\n </subquestion>');
    fprintf(file,'\n  <shuffleanswers>true</shuffleanswers>');
    fprintf(file,'\n    <tolerance>0.001</tolerance>');
    fprintf(file,'\n  </question>');

end

%xml closing code
fprintf(file, quiz_end()); 
fclose(file);