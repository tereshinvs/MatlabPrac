function varargout = conv_hull(varargin)
% CONV_HULL MATLAB code for conv_hull.fig
%      CONV_HULL, by itself, creates a new CONV_HULL or raises the existing
%      singleton*.
%
%      H = CONV_HULL returns the handle to a new CONV_HULL or the handle to
%      the existing singleton*.
%
%      CONV_HULL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONV_HULL.M with the given input arguments.
%
%      CONV_HULL('Property','Value',...) creates a new CONV_HULL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before conv_hull_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to conv_hull_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help conv_hull

% Last Modified by GUIDE v2.5 27-Oct-2013 00:28:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @conv_hull_OpeningFcn, ...
                   'gui_OutputFcn',  @conv_hull_OutputFcn, ...
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


% --- Executes just before conv_hull is made visible.
function conv_hull_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to conv_hull (see VARARGIN)

% Choose default command line output for conv_hull
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes conv_hull wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global x;
global y;
global point_colour;
global conv_hull_need;
global ind;
global line_colour;
global line_width;
x = [];
y = [];
point_colour = [1, 0, 0];
conv_hull_need = 0;
ind = [];
line_colour = [0, 0, 1];
line_width = 0.5;


% --- Outputs from this function are returned to the command line.
function varargout = conv_hull_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function update_plot()
	global x;
	global y;
	global point_colour;
	global conv_hull_need;
	global ind;
	global line_colour;
	global line_width;
	cla();
	plot(x, y, 'Color', point_colour, 'LineStyle', 'none', 'Marker', '*', 'MarkerSize', 12);
	if conv_hull_need == 1
		h = figure;
		hold on;
		plot(x(ind), y(ind), 'Color', line_colour, 'LineWidth', line_width);
		plot(x, y, 'Color', point_colour, 'LineStyle', 'none', 'Marker', '*', 'MarkerSize', 12);
	end

% --- Executes on button press in open_file_button.
function open_file_button_Callback(hObject, eventdata, handles)
% hObject    handle to open_file_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	global x;
	global y;
    [filename, filepath] = uigetfile('*.mat', 'Load point data');
    var_list = whos('-file', [filepath, filename]);
    points_memb = ismember('points', { var_list.name });
    if (points_memb(1) == 0)
        msgbox('Incorrect data', 'Error');
        return
    end
    load([filepath, filename], 'points');
    N = size(points, 1);
    M = size(points, 2);
    if M ~= 2
        msgbox('Incorrect data', 'Error');
        return;
	end
	x = [x; points(:, 1)];
	y = [y; points(:, 2)];
	update_plot();


% --- Executes on button press in set_point_button.
function set_point_button_Callback(hObject, eventdata, handles)
% hObject    handle to set_point_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	global x;
	global y;
    [x_, y_] = ginput(1);
	x = [x; x_];
	y = [y; y_];
    update_plot();

% --- Executes on button press in save_points_button.
function save_points_button_Callback(hObject, eventdata, handles)
% hObject    handle to save_points_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	global x;
	global y;
    [filename, filepath] = uiputfile('*.mat', 'Save point data');
    points = [x, y]
    save([filepath, filename], 'points');


% --- Executes on button press in clear_button.
function clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global x;
	global y;
	global conv_hull_need;
	global ind;
	x = [];
	y = [];
	conv_hull_need = 0;
	ind = [];
	update_plot();


% --- Executes on button press in convhull_button.
function convhull_button_Callback(hObject, eventdata, handles)
% hObject    handle to convhull_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	global x;
	global y;
	global conv_hull_need;
	global ind;
	ind = convexHull(x, y);
	conv_hull_need = 1;
	update_plot();



function vertex_r_Callback(hObject, eventdata, handles)
% hObject    handle to vertex_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vertex_r as text
%        str2double(get(hObject,'String')) returns contents of vertex_r as a double
	global point_colour;
	point_colour(1) = str2double(get(handles.vertex_r, 'String'));
	update_plot();


% --- Executes during object creation, after setting all properties.
function vertex_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vertex_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vertex_g_Callback(hObject, eventdata, handles)
% hObject    handle to vertex_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vertex_g as text
%        str2double(get(hObject,'String')) returns contents of vertex_g as a double
	global point_colour;
	point_colour(2) = str2double(get(handles.vertex_g, 'String'));
	update_plot();


% --- Executes during object creation, after setting all properties.
function vertex_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vertex_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vertex_b_Callback(hObject, eventdata, handles)
% hObject    handle to vertex_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vertex_b as text
%        str2double(get(hObject,'String')) returns contents of vertex_b as a double
	global point_colour;
	point_colour(3) = str2double(get(handles.vertex_b, 'String'));
	update_plot();


% --- Executes during object creation, after setting all properties.
function vertex_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vertex_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function line_r_Callback(hObject, eventdata, handles)
% hObject    handle to line_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of line_r as text
%        str2double(get(hObject,'String')) returns contents of line_r as a double
	global line_colour;
	line_colour(1) = str2double(get(handles.line_r, 'String'));
	update_plot();


% --- Executes during object creation, after setting all properties.
function line_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to line_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function line_g_Callback(hObject, eventdata, handles)
% hObject    handle to line_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of line_g as text
%        str2double(get(hObject,'String')) returns contents of line_g as a double
	global line_colour;
	line_colour(2) = str2double(get(handles.line_g, 'String'));
	update_plot();


% --- Executes during object creation, after setting all properties.
function line_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to line_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function line_b_Callback(hObject, eventdata, handles)
% hObject    handle to line_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of line_b as text
%        str2double(get(hObject,'String')) returns contents of line_b as a double
	global line_colour;
	line_colour(3) = str2double(get(handles.line_b, 'String'));
	update_plot();


% --- Executes during object creation, after setting all properties.
function line_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to line_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function line_width_edit_Callback(hObject, eventdata, handles)
% hObject    handle to line_width_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of line_width_edit as text
%        str2double(get(hObject,'String')) returns contents of line_width_edit as a double
	global line_width;
	line_width = str2double(get(handles.line_width_edit, 'String'));
	update_plot();


% --- Executes during object creation, after setting all properties.
function line_width_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to line_width_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in undo_button.
function undo_button_Callback(hObject, eventdata, handles)
% hObject    handle to undo_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	global x;
	global y;
	global conv_hull_need;
	global ind;
	if size(x, 1) == 0
		return;
	end
	x = x(1 : end - 1);
	y = y(1 : end - 1);
	conv_hull_need = 0;
	ind = [];
	update_plot();
