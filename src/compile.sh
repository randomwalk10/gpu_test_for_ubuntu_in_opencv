#echo "compile turbo_pyramid_builder in debug mode?[Y/N]"
#read mode
#compile_mode="-O4"
#if [ "$mode" == "y" ] || [ "$mode" == "Y" ]; then
	#echo "debug mode is activated"
	#compile_mode="-O0 -g"
#fi
#echo "output in dmetrix format?[Y/N]"
#read select
#echo "run in standalone mode?[Y/N]"
#read isStandAlone
#standalone_mode="-D INTEGRATION_MODE"
#if [ "$isStandAlone" == "y" ] || [ "$isStandAlone" == "Y" ]; then
	#echo "standalone mode is activated"
	#standalone_mode="-D STANDALONE_MODE"
#fi
#g++ $standalone_mode -std=c++11 $compile_mode -c ./dm_img_proc_lib_basics.cpp
#if [ "$select" == "y" ] || [ "$select" == "Y" ]; then
	#echo "DM_OUTPUT is defined"
	#g++ -D DM_OUTPUT $standalone_mode -std=c++11 $compile_mode -c ./turbo_pyramid_builder_lib.cpp
#else
	#g++ $standalone_mode -std=c++11 $compile_mode -c ./turbo_pyramid_builder_lib.cpp
#fi
#g++ $standalone_mode -std=c++11 $compile_mode -c ./dm_img_lrucache_lib.cpp
#g++ $standalone_mode -std=c++11 $compile_mode -c ./main.cpp

#g++ $standalone_mode -std=c++11 $compile_mode ./dm_img_proc_lib_basics.o ./turbo_pyramid_builder_lib.o ./dm_img_lrucache_lib.o ./main.o -o ./turbo_pyramid_tester -L/usr/local/lib -L/usr/lib/x86_64-linux-gnu -lpthread -l-lopencv_imgcodecs -l-lopencv_core -l-lopencv_imgproc -l-lopencv_stitching

g++ -std=c++11 -O4 -c ./performance.cpp -I/usr/local/include
g++ -std=c++11 -O4 -c ./tests.cpp -I/usr/local/include -I/usr/local/cuda/include

g++ -std=c++11 -O4 ./performance.o ./tests.o -o ./gpu_tester -L/usr/local/lib \
	-lopencv_calib3d -lopencv_core -lopencv_cudaarithm -lopencv_cudabgsegm -lopencv_cudacodec \
	-lopencv_cudafeatures2d -lopencv_cudafilters -lopencv_cudaimgproc -lopencv_cudalegacy \
	-lopencv_cudaobjdetect -lopencv_cudaoptflow -lopencv_cudastereo -lopencv_cudawarping \
	-lopencv_cudev -lopencv_dnn -lopencv_features2d -lopencv_flann -lopencv_highgui \
	-lopencv_imgcodecs -lopencv_imgproc -lopencv_ml -lopencv_objdetect -lopencv_photo \
	-lopencv_shape -lopencv_stitching -lopencv_superres -lopencv_videoio -lopencv_video \
	-lopencv_videostab
