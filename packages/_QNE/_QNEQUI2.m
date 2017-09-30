;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QNEQUI2^INT^1^59547,73879^0
QNEQUI2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
ACT(NOM,MODAF,GOTO,NAFF,ABANDON) 
 N TEMP,INSEP,INSEPI,INCOMPG,INC,INCOMP,I,VT,MSG,ADR,CTR,MEN,APPEL
 N CYCLE,INSEPK,INCOMPK,TEMPS,L,TAL,TAG,LLISTEN,DMULT,BASEL,ADRL,INCOMPL
 D INIGL^%QNEQUI3,INIAT^%QNEQUI3(NOM,.MSG)
 S ABANDON=0
 I MSG'="" G FIN
 D INITFI^%QCASTA(APPEL),MENU^%QNEQUI3(MEN)
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"FIN")
 D INCO I MSG'="" G END
ACTM 
 S MSG="",DX=0,DY=21 D CLEBAS^%VVIDEO
 I GOTO'="" G @GOTO
 D ^%VQUIKMN(0,79,22,MEN,.ADR,.CTR) I (CTR="A")!(CTR="F") G FIN
 G:ADR="" ACTM G @ADR
 
AUT I $$PILEVIDE^%QCASTA(APPEL) D CLFEN^%VVIDEO(0,22,2,RM-3),POCLEPA^%VVIDEO X XY I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous vraiment (re)lancer un equilibrage automatique")_" ? ")'=1 G ACTM
 
 S GOTO=""
 I $$STATUT^%QNEQUI8(VT,"CREATION.LISTES.TEMPO") D CRELIS^%QNEQUI3
 I ('($D(LLISTEN)))!(LLISTEN="") D LLISTEN^%QNEQUI3(.LLISTEN,"E")
 D AJOUTL^%QNEQETU(NOM,LLISTEN)
 I $$STATUT^%QNEQUI8(VT,"VERIF.INSEP.INCOMP") D CGL G:MSG'="" END
 D DEB^%VTEMPS($P($ZPOS,"^",2))
 D ^%QNEQUi(L,ADRL,.TEMPS,INC,INCOMPG,INCOMPL,INSEP,INSEPI,.CYCLE,TAL,TAG,"$$^%QSCALVA("""_BASEL_""")","ADR^%QNEQUI3("""_NOM_""","""_BASEL_""")","DEL^%QSGES11",LLISTEN,@VT@("LLISTE"),VT,MODAF,DMULT,NAFF,.ABANDON,.MSG)
 
 
 D AJOUT^%QNEQETU(NOM,"DUREE",$$FIN^%VTEMPS($P($ZPOS,"^",2)),1)
 I '(NAFF) D VISU^%QNEQUI3(NOM)
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"AUT")
 
 I GOTO="" S GOTO="ASS"
 G MAJ
 
ASS S GOTO=""
 D DEB^%VTEMPS($P($ZPOS,"^",2))
 D ^%QNEQUI8(NOM,L,TEMPS,INC,INCOMPG,INCOMPL,INSEPK,INSEPI,INCOMPK,.CYCLE,.TAL,.TAG,.LLISTEN,@VT@("GRO"),VT,"E",MODAF,.DMULT,.MSG,.GOTO)
 D AJOUT^%QNEQETU(NOM,"DUREE",$$FIN^%VTEMPS($P($ZPOS,"^",2)),1)
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"ASS")
 G CONCL
 
GRLI S GOTO=""
 D ^%QNEQUI8(NOM,L,TEMPS,INC,INCOMPG,INCOMPL,INSEPK,INSEPI,INCOMPK,.CYCLE,.TAL,.TAG,.LLISTEN,@VT@("GRO"),VT,"L",MODAF,.DMULT,.MSG,.GOTO)
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"GRLI")
 G CONCL
 
GROU S GOTO=""
 D ^%QNEQUI8(NOM,L,TEMPS,INC,INCOMPG,INCOMPL,INSEPK,INSEPI,INCOMPK,.CYCLE,.TAL,.TAG,.LLISTEN,@VT@("GRO"),VT,"G",MODAF,.DMULT,.MSG,.GOTO)
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"GROU")
 G CONCL
 
SEP S GOTO=""
 D ^%QNEQUI8(NOM,L,TEMPS,INC,INCOMPG,INCOMPL,.INSEPK,INSEPI,INCOMPK,CYCLE,TAL,TAG,LLISTEN,@VT@("GROSEP"),VT,"S",MODAF,DMULT,.MSG,.GOTO)
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"SEP")
 D:MSG="" INCO,CGL
 G CONCL
 
COM S GOTO=""
 D ^%QNEQUI8(NOM,L,TEMPS,INC,INCOMPG,INCOMPL,INSEPK,INSEPI,.INCOMPK,CYCLE,TAL,TAG,LLISTEN,@VT@("GROCOM"),VT,"C",MODAF,DMULT,.MSG,.GOTO)
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"COM")
 D:MSG="" INCO,CGL
 G CONCL
 
MOD S GOTO=""
 D LOAD^%QNEQET2(NOM,.RESUL)
 S MSG=$$CR1^%QNEQACT(.RESUL) K RESUL,PATOUCH,AFRESU,OR,SCR,ABENDSCR,DEJALU
 D:MSG=1 INIAT^%QNEQUI3(NOM,.MSG),INCO,CGL S:MSG=0 MSG=""
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"MOD")
 I MSG'="" D:'(NAFF) ^%VZEAVT(MSG)
 G REAF
 
VISU S GOTO=""
 D VISU^%QNEQUI3(NOM)
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"VISU")
 G REAF
 
TRT S GOTO=""
 D ^%TLMENUG
 S GOTO=$$APPEL^%QNEQUY(APPEL,GOTO,"TRT")
 G REAF
 
CONCL 
 I (MSG'="")&(MSG'=" ") D:'(NAFF) ^%VZEAVT(MSG)
MAJ D AJOUTL^%QNEQETU(NOM,LLISTEN)
 I $$STATUT^%QNEQUI8(VT,"MAJ.INDICATEURS") D MAJ1^%QNEQU11(CYCLE,TEMPS,NOM,L,LLISTEN,VT)
 
REAF D:'(NAFF) AFF(VT)
 G ACTM
 
END 
 I '(NAFF) D ^%VZEAVT(MSG)
 G REAF
 
FIN D ^%VZEATT
 I $$STATUT^%QNEQUI8(VT,"CREATION.LISTES.TEMPO")=0 D DEL^%QSGES11(@VT@("LIND")),DEL^%QSGES11(@VT@("LH")),DEL^%QSGES11(@VT@("INSEPL")),DEL^%QSGES11(@VT@("LG"))
 
 D SUPA^%QNEQETU(NOM,"ERREUR")
 I MSG'="" D AJOUT^%QNEQETU(NOM,"ERREUR",MSG,1)
 K @(TEMP)
 Q MSG
 
 
AFF(VT) 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW($S(@VT@("GOTO")="SEP":"inseparables",@VT@("GOTO")="COM":"incompatibles",1:"activation")_" de l'etude")_" "_@VT@("ETUDE"),0)
 Q
 
CGL 
 D MSG^%VZEATT($$^%QZCHW("Constitution et verification des donnees"))
 K @(INSEPI),@(INC),@(INCOMPG)
 D VER^%QNEQUI1(ADRL,@VT@("INSEP"),@VT@("INCOMP"),INSEPI,INC,INCOMPG,.MSG)
 D STATSET^%QNEQUI8(VT,"VERIF.INSEP.INCOMP",1)
 Q
 
INCO 
 S @VT@("INSEP")=INSEP,@VT@("INCOMP")=INCOMP
 D INSEP(INSEPK,INSEP,"S",.MSG) Q:MSG'=""
 
 D INSEP(INCOMPK,INCOMP,"C",.MSG)
 Q
INSEP(INSEPK,INSEP,UTIL,MSG) 
 N ADR1,ADRK,L1,I
 K @(INSEP) I INSEPK="" Q
 S ADRK=$$ADRLIS^%QSGEST7(INSEPK)
 I ADRK="" S MSG=$$^%QZCHW("impossible de retrouver les individus de la liste")_" "_$$^%QZCHW("des "_$S(UTIL="S":"inseparables",1:"incompatibles"))_" "_INSEPK Q
 S L1=$O(@ADRK@(""))
 F I=0:0 Q:L1=""  D INSEP1 S L1=$O(@ADRK@(L1))
 Q
INSEP1 
 S ADR1=$$ADRLIS^%QSGEST7(L1)
 I (ADR1="")!(ADR1=0) S @INSEP@(L1)="BIDON" Q
 S @INSEP@(L1)=ADR1
 Q

