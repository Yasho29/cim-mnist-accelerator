%% load test set images
images = loadMNISTImages( 't10k-images' ) ;
labels = loadMNISTLabels( 't10k-labels' )' ;
%% Viewing images
imageNums = 248 : (248+24) ;
numRows = 5 ;
numCols = 5 ;
    I = reshape( images( :, imageNums ), 28, 28 * numRows, numCols ) ;
        eval( [ 'I = [ ' sprintf( 'I(:,:,%d);', 1 : numCols ) ' ];' ] );
    low  = 0 ;
    high = 1 ;
imshow( I, [low high] ) ;