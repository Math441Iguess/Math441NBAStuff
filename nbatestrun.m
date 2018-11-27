% from gurobi import *

% nbaTESTING = Model('NBATeamBuilder');

numVars = 283;

x = numVars;

alpha = 1000000;

model.obj = [[Salary'] -alpha]

model.A = sparse([-PLAYER; PLAYER; -INDMIN; -INDPTS; -INDAST; -INDORB; -INDDRB; -INDTRB; -INDSTL;
-INDBLK; -INDTOV; INDPF; -INDFGM; -INDFGA; -INDTPA; -INDFTM; -INDFTA;
NEWVARREQ1; NEWVARREQ2]);

model.rhs =[-MINROSTER; MAXROSTER; -TEAMMIN; -TEAMPTS; -TEAMAST; -TEAMORB; -TEAMDRB;
-TEAMTRB; -TEAMSTL; -TEAMBLK; -TEAMTOV; TEAMPF; -TEAMFGM; -TEAMFGA;
-TEAMTPA; -TEAMFTM; -TEAMFTA; TEAMTPM; 0];

model.sense = '<';
model.vtype = 'B';
model.modelsense = 'min';
% nbaTESTING.varnames = names;

gurobi_write(model, 'nbatestrun.lp');

params.outputflag = 0;

result = gurobi(model,params);

disp(result);

 for v=1:length(names)
     fprintf('%s %e', names(v),result.x(v));
 end

 fprintf('Obj: %e', result.objval);

% printAttribute('names')

