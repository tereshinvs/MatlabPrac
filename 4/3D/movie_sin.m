function varargout = movie_sin(varargin)
% MOVIE_SIN MATLAB code for movie_sin.fig
%      MOVIE_SIN, by itself, creates a new MOVIE_SIN or raises the existing
%      singleton*.
%
%      H = MOVIE_SIN returns the handle to a new MOVIE_SIN or the handle to
%      the existing singleton*.
%
%      MOVIE_SIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOVIE_SIN.M with the given input arguments.
%
%      MOVIE_SIN('Property','Value',...) creates a new MOVIE_SIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before movie_sin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to movie_sin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help movie_sin

% Last Modified by GUIDE v2.5 02-Dec-2013 09:46:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @movie_sin_OpeningFcn, ...
                   'gui_OutputFcn',  @movie_sin_OutputFcn, ...
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


% --- Executes just before movie_sin is made visible.
function movie_sin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to movie_sin (see VARARGIN)

% Choose default command line output for movie_sin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes movie_sin wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global alr;
alr = 0;

% --- Outputs from this function are returned to the command line.
function varargout = movie_sin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function result = get_movie()
	[x, y] = meshgrid(-10 : 0.1 : 10, -10 : 0.1 : 10);
	axis tight;
	for k = 1 : 300
		surf(x, y, f(x, y, k));
		M(k) = getframe();
	end
	result = M;


% --- Executes on selection change in colormap_popup.
function colormap_popup_Callback(hObject, eventdata, handles)
% hObject    handle to colormap_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns colormap_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from colormap_popup
	value = get(handles.colormap_popup, 'Value');
	if value == 1
		colormap('Default');
	end
	if value == 2
		colormap('Spring');
	end
	if value == 3
		colormap('Summer');
	end
	if value == 4
		colormap('Autumn');
	end
	if value == 5
		colormap('Winter');
	end

% --- Executes during object creation, after setting all properties.
function colormap_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colormap_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in play_button.
function play_button_Callback(hObject, eventdata, handles)
% hObject    handle to play_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	get_movie();

% --- Executes on button press in save_as_mat.
function save_as_mat_Callback(hObject, eventdata, handles)
% hObject    handle to save_as_mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	M = get_movie();
	[filename, filepath] = uiputfile('*.mat', 'Save as mat');
	save([filepath, filename], 'M');

% --- Executes on button press in save_as_avi.
function save_as_avi_Callback(hObject, eventdata, handles)
% hObject    handle to save_as_avi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	M = get_movie();
	[filename, filepath] = uiputfile('*.avi', 'Save as avi');
	movie2avi(M, [filepath, filename]);


% --- Executes on slider movement.
function level_slider_Callback(hObject, eventdata, handles)
% hObject    handle to level_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function level_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to level_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in contour_button.
function contour_button_Callback(hObject, eventdata, handles)
% hObject    handle to contour_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	alpha = str2double(get(handles.alpha_edit, 'String'));
	[x, y] = meshgrid(-10 : 0.1 : 10, -10 : 0.1 : 10);
	z = f(x, y, alpha);
	min_f = min(min(z));
	max_f = max(max(z));
	level = min_f + (max_f - min_f) * get(handles.level_slider, 'Value');
	contour(x, y, z, [level level]);



function alpha_edit_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_edit as text
%        str2double(get(hObject,'String')) returns contents of alpha_edit as a double


% --- Executes during object creation, after setting all properties.
function alpha_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in surf_button.
function surf_button_Callback(hObject, eventdata, handles)
% hObject    handle to surf_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	[x, y] = meshgrid(-10 : 0.1 : 10, -10 : 0.1 : 10);
	surf(x, y, f(x, y, 150));


% --- Executes on button press in play_avi_button.
function play_avi_button_Callback(hObject, eventdata, handles)
% hObject    handle to play_avi_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	[filename, filepath] = uigetfile('*.avi', 'Play avi');
	system(['totem "' filepath filename '"']);

