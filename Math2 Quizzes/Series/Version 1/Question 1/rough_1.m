   
    a = randi([1 20],1,1) 
    b = randi([80 100],1,1)  
    c = randi([0 1],1,1)
    d = 2;
    
    if (c==0)
    
    if ((mod(a,2) ~= 0) && (mod(b,2) ~= 0))
    n = (((((b-1))-(a+1))/2)) + 2
    sum = n/2*(2*(a) + (n-1)*d)
    end
    
    if ((mod(a,2) == 0) && (mod(b,2) ~= 0))
    n = ((((b-1))-(a))/2) + 1
    sum = n/2*(2*(a+1) + (n-1)*d)
    end
    
    if ((mod(a,2) ~= 0) && (mod(b,2) == 0))
    n = (((b)-(a+1))/2) + 1
    sum = n/2*(2*(a) + (n-1)*d)
    end
       
    if ((mod(a,2) == 0) && (mod(b,2) == 0))
    n = ((b)-(a))/2
    sum = n/2*(2*(a+1) + (n-1)*d)
    end
    
    else
        
    if ((mod(a,2) ~= 0) && (mod(b,2) ~= 0))
    n = ((b)-(a))/2
    sum = n/2*(2*(a+1) + (n-1)*d)
    end
    
    if ((mod(a,2) == 0) && (mod(b,2) ~= 0))
    n = ((((b))-(a+1))/2) + 1
    sum = n/2*(2*(a) + (n-1)*d)
    end
    
    if ((mod(a,2) ~= 0) && (mod(b,2) == 0))
    n = (((b-1)-(a))/2) + 1
    sum = n/2*(2*(a+1) + (n-1)*d)
    end
       
    if ((mod(a,2) == 0) && (mod(b,2) == 0))
    n = (((b-1)-(a+1))/2) + 2
    sum = n/2*(2*(a) + (n-1)*d)
    end    
        
    end
    
    
    
    
    
    
    
   
    