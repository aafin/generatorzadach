@echo off


if -%1- == -- goto end

if -%1- == -mkdir- goto mkalldir

goto end


:mkalldir
shift


goto end


:end