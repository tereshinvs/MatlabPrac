function varargout = task3(varargin)
% TASK3 MATLAB code for task3.fig
%      TASK3, by itself, creates a new TASK3 or raises the existing
%      singleton*.
%
%      H = TASK3 returns the handle to a new TASK3 or the handle to
%      the existing singleton*.
%
%      TASK3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK3.M with the given input arguments.
%
%      TASK3('Property','Value',...) creates a new TASK3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before task3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to task3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help task3

% Last Modified by GUIDE v2.5 15-Dec-2013 12:16:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @task3_OpeningFcn, ...
                   'gui_OutputFcn',  @task3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before task3 is made visible.
function task3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to task3 (see VARARGIN)

% Choose default command line output for task3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes task3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global left_f;
global right_f;
left_f = @sin;
right_f = @(x) x.^3 + x - 1;

% --- Outputs from this function are returned to the command line.
function varargout = task3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in solve_button.
function solve_button_Callback(hObject, eventdata, handles)
% hObject    handle to solve_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	global left_f;
	global right_f;
	
	cla();

	xmin = str2double(get(handles.left_bound, 'String'));
	xmax = str2double(get(handles.right_bound, 'String'));
	
	if ~isnan(xmin) && ~isnan(xmax) && xmin < xmax
		set(handles.laxes, 'XLim', [xmin xmax]);
	end
	
	x = xmin : 0.01 : xmax;
	hold on;
	plot(x, left_f(x), 'g');
	plot(x, right_f(x), 'b');
	
	[x_start ~] = ginput(1);
	sol = fzero(@(x) left_f(x) - right_f(x), x_start);
	plot(sol, left_f(sol), 'r*');


function left_bound_Callback(hObject, eventdata, handles)
% hObject    handle to left_bound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of left_bound as text
%        str2double(get(hObject,'String')) returns contents of left_bound as a double


% --- Executes during object creation, after setting all properties.
function left_bound_CreateFcn(hObject, eventdata, handles)
% hObject    handle to left_bound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function right_bound_Callback(hObject, eventdata, handles)
% hObject    handle to right_bound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of right_bound as text
%        str2double(get(hObject,'String')) returns contents of right_bound as a double


% --- Executes during object creation, after setting all properties.
function right_bound_CreateFcn(hObject, eventdata, handles)
% hObject    handle to right_bound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
