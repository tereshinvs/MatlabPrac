function varargout = functions_min_max(varargin)
% FUNCTIONS_MIN_MAX MATLAB code for functions_min_max.fig
%      FUNCTIONS_MIN_MAX, by itself, creates a new FUNCTIONS_MIN_MAX or raises the existing
%      singleton*.
%
%      H = FUNCTIONS_MIN_MAX returns the handle to a new FUNCTIONS_MIN_MAX or the handle to
%      the existing singleton*.
%
%      FUNCTIONS_MIN_MAX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FUNCTIONS_MIN_MAX.M with the given input arguments.
%
%      FUNCTIONS_MIN_MAX('Property','Value',...) creates a new FUNCTIONS_MIN_MAX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before functions_min_max_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to functions_min_max_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help functions_min_max

% Last Modified by GUIDE v2.5 16-Dec-2013 08:56:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @functions_min_max_OpeningFcn, ...
                   'gui_OutputFcn',  @functions_min_max_OutputFcn, ...
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


% --- Executes just before functions_min_max is made visible.
function functions_min_max_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to functions_min_max (see VARARGIN)

% Choose default command line output for functions_min_max
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes functions_min_max wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global function_names;
global functions;
function_names = { 'Sin'; 'Cos'; 'Exp'; 'xsinx'; 'x^3 + x^2 - x + 1' };
functions = { @sin, @cos, @exp, (@(x) x .* sin(x)), (@(x) x.^3 + x.^2 - x + 1) };
set(handles.function_popup, 'String', function_names);
hold on;


% --- Outputs from this function are returned to the command line.
function varargout = functions_min_max_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function result = get_x(handles)
	xlimit = get(handles.laxes, 'XLim');
	result = xlimit(1) : 0.01 : xlimit(2);

function update_plot(handles)
	global functions;
	cla();
	x = get_x(handles);
	colour = get(handles.graph_colour, 'Value');
	c = '';
	if colour == 1
		c = 'b';
	end
	if colour == 2
		c = 'r';
	end
	if colour == 3
		c = 'g';
	end
	plot(x, functions{(get(handles.function_popup, 'Value'))}(x), c);


% --- Executes on selection change in function_popup.
function function_popup_Callback(hObject, eventdata, handles)
% hObject    handle to function_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns function_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from function_popup
	%update_plot(handles);

% --- Executes during object creation, after setting all properties.
function function_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to function_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmin_edit_Callback(hObject, eventdata, handles)
% hObject    handle to xmin_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmin_edit as text
%        str2double(get(hObject,'String')) returns contents of xmin_edit as a double
	lims = get(handles.laxes, 'XLim');
	lims(1) = str2double(get(handles.xmin_edit, 'String'));
	set(handles.laxes, 'XLim', lims);


% --- Executes during object creation, after setting all properties.
function xmin_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmin_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmax_edit_Callback(hObject, eventdata, handles)
% hObject    handle to xmax_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmax_edit as text
%        str2double(get(hObject,'String')) returns contents of xmax_edit as a double
	lims = get(handles.laxes, 'XLim');
	lims(2) = str2double(get(handles.xmax_edit, 'String'));
	set(handles.laxes, 'XLim', lims);


% --- Executes during object creation, after setting all properties.
function xmax_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmax_edit (see GCBO)	curf = functions{(get(handles.function_popup, 'Value'))};
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plot_button.
function plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	update_plot(handles);


% --- Executes on button press in min_button.
function min_button_Callback(hObject, eventdata, handles)
% hObject    handle to min_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	global functions;
	curf = functions{(get(handles.function_popup, 'Value'))};
	x = get_x(handles);
	y = curf(x);
	lst = get_local_mins(y);
	colour = get(handles.mins_colour, 'Value');
	c = '';
	if colour == 1
		c = 'r';
	end
	if colour == 2
		c = 'b';
	end
	if colour == 3
		c = 'g';
	end
	mark = get(handles.mins_mark, 'Value');
	m = '';
	if mark == 1
		m = '*';
	end
	if mark == 2
		m = 'o';
	end
	[c m]
	plot(x(lst), y(lst), [c m]);

	% --- Executes on button press in max_button.
function max_button_Callback(hObject, eventdata, handles)
% hObject    handle to max_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	global functions;
	curf = functions{(get(handles.function_popup, 'Value'))};
	x = get_x(handles);
	y = curf(x);
	lst = get_global_max(y);
	text(x(lst), y(lst), 'Maximum');


% --- Executes on button press in con_button.
function con_button_Callback(hObject, eventdata, handles)
% hObject    handle to con_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	update_plot(handles);
	global functions;
	curf = functions{(get(handles.function_popup, 'Value'))};
	x = get_x(handles);
	y = curf(x);
	[~, maximum] = ginput(1);
	lst = find(y <= maximum);
	plot(x(lst), zeros(1, size(lst, 2)), 'g*');
	res = 1;
	for i = 2 : size(lst, 2)
		if lst(i) > lst(i - 1) + 1
			res = res + 1;
		end
	end
	set(handles.con_text, 'String', num2str(res));


% --- Executes on button press in comet_button.
function comet_button_Callback(hObject, eventdata, handles)
% hObject    handle to comet_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	global functions;
	curf = functions{(get(handles.function_popup, 'Value'))};
	x = get_x(handles);
	y = curf(x);
	lst_max = get_global_max(y);
	lst_min = get_local_mins(y);
	for i = 1 : size(lst_max, 1)
		dist_to_min = lst_min;
		for j = 1 : size(dist_to_min, 1)
			dist_to_min(j) = abs(dist_to_min(j) - lst_max(i));
		end
		[~, tmp] = min(dist_to_min);
		pos1 = lst_min(tmp(1));
		pos2 = lst_max(i);
		if pos1 > pos2
			tmp = pos1;
			pos1 = pos2;
			pos2 = tmp;
		end
		plot(x(pos1) : 0.01 : x(pos2), curf(x(pos1) : 0.01 : x(pos2)), 'Color', 'yellow');
	end
	


% --- Executes on selection change in graph_colour.
function graph_colour_Callback(hObject, eventdata, handles)
% hObject    handle to graph_colour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graph_colour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph_colour


% --- Executes during object creation, after setting all properties.
function graph_colour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph_colour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in mins_mark.
function mins_mark_Callback(hObject, eventdata, handles)
% hObject    handle to mins_mark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mins_mark contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mins_mark


% --- Executes during object creation, after setting all properties.
function mins_mark_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mins_mark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in mins_colour.
function mins_colour_Callback(hObject, eventdata, handles)
% hObject    handle to mins_colour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mins_colour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mins_colour


% --- Executes during object creation, after setting all properties.
function mins_colour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mins_colour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
