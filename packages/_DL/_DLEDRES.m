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

;%DLEDRES^INT^1^59547,73867^0
DLEDRES ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
JALON(JALON,DESOP,OPER,ETU,LISRES) 
 D SAUV^%DLEDDAT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLJAL=$$CONCAS^%QZCHAD(TEMP,"JALON")
 S GLFEN=$$CONCAS^%QZCHAD(TEMP,"FENETRE")
 
 S GLMOD=$$CONCAS^%QZCHAD(TEMP,"JALONS.MODIFIES")
 
 D INIT
 D CLEPAG^%VVIDEO
 
 D ^%QUOLST(GLFEN)
 
 D MESS
 K @(TEMP)
 D RESTOR^%DLEDDAT
 Q
 
INIT 
 N NA,ND,NUML
 S NUML=0,ND=""
BCLD S ND=$O(@JALON@(ND)) I ND="" G FEN
 S NA=""
BCLA S NA=$O(@JALON@(ND,NA)) I NA="" G BCLD
 S NUML=NUML+1
 S @GLJAL@(NUML)=@DESOP@(ND)_"^"_@DESOP@(NA)_"^"_@JALON@(ND,NA)
 G BCLA
 
FEN 
 S @GLFEN@("TI")=$$^%QZCHW("Jalons pour l'etude")_" "_ETU
 S @GLFEN@("X")=2,@GLFEN@("Y")=1,@GLFEN@("L")=76,@GLFEN@("H")=21
 
 S @GLFEN@("LI",1,"T")="1ere operation",@GLFEN@("LI",1,"X")=1
 S @GLFEN@("LI",2,"T")="2eme operation",@GLFEN@("LI",2,"X")=30
 S @GLFEN@("LI",3,"T")="valeur jalon",@GLFEN@("LI",3,"X")=60,@GLFEN@("LI",3,"U")="JAL^%DLEDRES"
 
 S @GLFEN@("A")=GLJAL
 S @GLFEN@("UCMO")="MODJAL^%DLEDRES"
 
 S @GLFEN@("CHI",1)="",@GLFEN@("CHI",2)=""
 Q
 
MODJAL 
 N CO,NA,ND
 S CO=@A@(LC)
 
 S ND=@OPER@($P(CO,"^",1)),NA=@OPER@($P(CO,"^",2))
 
 S @JALON@(ND,NA)=Y1
 S @GLMOD@(ND,NA)=Y1
 S OK=1
 Q
 
JAL 
 S OK=$$ENTP^%QZNBN(Y1)
 Q
 
 
 
 
 
 
 
 
GRAPH(GRAPH,GRAPHINV,JALON,DESOP,OPER,ETU,POIDS,CHEMINV,CHEM,MAX,LISRES) 
 D SAUV^%DLEDDAT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLARC=$$CONCAS^%QZCHAD(TEMP,"ARCS")
 S GLSOL=$$CONCAS^%QZCHAD(TEMP,"OPER.SOLITAIRES")
 
 S GLMOD=$$CONCAS^%QZCHAD(TEMP,"JALONS.MODIFIES")
 D ARC
 
 D ^%QUARBRE(GLARC,GLSOL,CHEM,"",$$^%QZCHW("Arbre pour l'etude")_" "_ETU_" ("_MAX_" "_$$^%QZCHW("jours")_")","MODGRA^%DLEDRES")
 
 D MESS
 K @(TEMP)
 S ^TEMPORAI($J,$P($ZPOS,"^",2),"MAX")=MAX
 D RESTOR^%DLEDDAT
 S MAX=^TEMPORAI($J,$P($ZPOS,"^",2),"MAX")
 K ^TEMPORAI($J,$P($ZPOS,"^",2),"MAX")
 Q
 
ARC 
 N OPA,OPD,SD,SA
 S SD=""
ARD S SD=$O(@DESOP@(SD)) I SD="" Q
 
 S OPD=@DESOP@(SD)
 I $$SOLIT(SD) S @GLSOL@(OPD)="" G ARD
 S SA=""
ARA S SA=$O(@GRAPH@(SD,SA)) I SA="" G ARD
 
 S OPA=@DESOP@(SA)
 S @GLARC@(OPD,OPA)=@GRAPH@(SD,SA)
 G ARA
 
SOLIT(OP) 
 I $D(@JALON@(OP)) Q 0
 N O S O=""
 F %O=0:0 S O=$O(@JALON@(O)) Q:O=""  I $D(@JALON@(O,OP)) Q
 I O="" Q 1
 Q 0
 
MODGRA(OPD,OPA,CONT) 
 
 N Y1,JAL,ND,NA
 S JAL=$P($P(CONT,"<",2),">")
 I JAL="" D ^%VSQUEAK Q
MVAL D POCLEPA^%VVIDEO
 S Y1=$$^%VZAME1($$^%QZCHW("Nouvelle valeur du jalon")_" ["_JAL_"] ? ")
 D POCLEPA^%VVIDEO
 I Y1="" Q
 I Y1=JAL Q
 I '($$ENTP^%QZNBN(Y1)) G MVAL
 
 
 S ND=@OPER@(OPD),NA=@OPER@(OPA)
 S JAL=Y1
 S @GRAPH@(ND,NA)=JAL,@GRAPHINV@(NA,ND)=JAL
 S @GLMOD@(ND,NA)=JAL
 
 S @ARBRE@(OPD,OPA)=JAL
 
 S REAF=1
 S CONT=$P(CONT,"<")_"<"_JAL_">"_$P(CONT,">",2)
 S Y1=$$LONG^%DLCHEM(DESOP,GRAPH,GRAPHINV,POIDS,CHEMINV,CHEM,.MAX)
 
 S MOD=1
 S TITRE=$$^%QZCHW("Arbre pour l'etude")_" "_ETU_" ("_MAX_" "_$$^%QZCHW("jours")_")"
 Q
 
MESS 
 N NA,ND,INDI
 S INDI=$S($D(@LISRES):@LISRES,1:0)
 S ND=""
MD S ND=$O(@GLMOD@(ND)) I ND="" S @LISRES=INDI Q
 S NA=""
MA S NA=$O(@GLMOD@(ND,NA)) I NA="" G MD
 S INDI=INDI+1
 S @LISRES@(INDI)="   "
 S INDI=INDI+1
 S @LISRES@(INDI)="*** "_$$^%QZCHW("entre l'operation")_" "_@DESOP@(ND)_" "_$$^%QZCHW("et l'operation")_" "_@DESOP@(NA)
 S INDI=INDI+1
 S @LISRES@(INDI)=$J("",5)_"--> "_$$^%QZCHW("la valeur du jalon devient")_" "_@GLMOD@(ND,NA)
 G MA

