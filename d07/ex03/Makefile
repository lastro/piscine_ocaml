NAME = test_army

SOURCES = army.ml people.ml doctor.ml dalek.ml main.ml

CAMLC = ocamlc
CAMLOPT = ocamlopt
CAMLDEP = ocamldep

OBJS = $(SOURCES:.ml=.cmo)
OPTOBJS = $(SOURCES:.ml=.cmx)
CMI = $(SOURCES:.ml=.cmi)

LIBS =

all: depend $(NAME)

$(NAME): opt byt
	(ls $(NAME) 2>/dev/null) || ln -s $(NAME).byt $(NAME)

opt: $(NAME).opt
byt: $(NAME).byt

$(NAME).byt: $(OBJS)
	$(CAMLC) -o $@ $(LIBS) $(OBJS)

$(NAME).opt: $(OPTOBJS)
	$(CAMLOPT) -o $@ $(LIBS:.cma=.cmxa) $(OPTOBJS)

%.cmo: %.ml
	$(CAMLC) -c $<

%.cmi: %.mli 
	$(CAMLC) -c $<

%.cmx: %.ml 
	$(CAMLOPT) -c $< 

clean:
	rm -f *~
	rm -f $(OBJS) $(OPTOBJS) $(CMI)
	rm -f $ $(SOURCES:.ml=.o)

fclean: clean
	rm -f $(NAME) $(NAME).opt $(NAME).byt

depend: .depend
	$(CAMLDEP) $(SOURCES) > .depend

re: fclean all

include .depend
