:: Entry point for running python scripts on windows systems.
:: To modify this file, edit `tools/run_python.bat` and then run
:: `tools/create_entry_points.py`

@setlocal
@set EM_PY=%EMSDK_PYTHON%
@if "%EM_PY%"=="" (
  set EM_PY=python
)

@if "%_EMCC_CCACHE%"=="" (
  :: Do regular invocation of em++.py compiler
  "%EM_PY%" "%~dp0\%~n0.py" %*
) else (
  :: Remove the ccache env. var, invoke ccache and re-enter this script to take the above branch.
  set _EMCC_CCACHE=
  ccache "%~dp0\%~n0.bat" %*
)
