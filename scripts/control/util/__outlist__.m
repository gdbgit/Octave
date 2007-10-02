## Copyright (C) 1996, 1998 Auburn University.  All rights reserved.
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by the
## Free Software Foundation; either version 2, or (at your option) any
## later version.
##
## Octave is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
## for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, write to the Free
## Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301 USA.

## Undocumented internal function.

## -*- texinfo -*-
## @deftypefn {Function File} {} __outlist__ (@var{lmat}, @var{tabchar}, @var{yd}, @var{ilist})
## Prints an enumerated list of strings.
## internal use only; minimal argument checking performed
##
## @strong{Inputs}
## @table @var
## @item        lmat
## list of strings
## @item        tabchar
## tab character (default: none)
## @item   yd
## indices of strings to append with the string "(discrete)"
## (used by @var{sysout}; minimal checking of this argument)
## @math{yd = []} indicates all outputs are continuous
## @item ilist
## index numbers to print with names.
##
## default: @code{1:rows(lmat)}
## @end table
##
## @strong{Outputs}
## prints the list to the screen, numbering each string in order.
## @end deftypefn

## Author: A. S. Hodel <a.s.hodel@eng.auburn.edu>
## Created: December 1995

function str_val = __outlist__ (name_list, tabchar, yd, ilist)

  if( nargin < 1 | nargin > 4 )
    print_usage ();
  endif

  m = length(name_list);
  if(nargin < 4)
    ilist = 1:m;
  endif
  if(nargin ==1)
    tabchar = "";
  endif

  if(nargin < 3)
    yd = zeros(1,m);
  elseif(isempty(yd))
    yd = zeros(1,m);
  endif

  str_val = "";
  dstr = {""," (discrete)"};
  if((m >= 1) && (iscell(name_list)))
    for ii=1:m
	str_val = sprintf("%s%s%d: %s%s\n",str_val,tabchar, ilist(ii), ...
			  name_list{ii},dstr{yd(ii)+1});
    endfor
  else
    str_val = sprintf("%sNone",tabchar);
  endif

endfunction
