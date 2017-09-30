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

;%AMRANAR^INT^1^59547,73865^0
%AMRANAR ;;05:47 PM  14 Oct 1993;
 
 
 
 
 
 
ANASYNT N PILEOP
 S PILEOP=$$TEMP^%SGUTIL
 
 S END=$ZP(@GLO@(""))+0
 S DEM1=""
 F %D=0:0 S DEM1=$O(@GLO@(DEM1)) Q:DEM1=""  Q:@GLO@(DEM1)="SI"
 I DEM1="" S DEM2=0 G ACTI
 S DEM1=DEM1+0
 S DEM2=DEM1
 F %D=0:0 S DEM2=$O(@GLO@(DEM2)) Q:DEM2=""  Q:@GLO@(DEM2)="ALORS"
 I DEM1'="",DEM2="" S RES=0 W !,"probleme lors de la recherche de la condition" S RES=1,PBME=1 Q
 S DEM2=DEM2+0
 I DEM2>DEM1 S POLO=POLO1,DEB=DEM1,FIN=DEM2-1 D ANAONE("CONDITION")
 I RES=0 W !,"probleme lors l'analyse syntaxique de la condition" S RES=1,PBME=1
ACTI S POLO=POLO2,DEB=DEM2,FIN=END D ANAONE("ACTION")
 I RES=0 W !,"probleme lors l'analyse syntaxique de l'action" S RES=1,PBME=1
 Q
 
 
ANAONE(NATURE) 
 N PILEOP
 S PILEOP=$$TEMP^%SGUTIL
 S @PILEOP=0
 S COUR=DEB,TYPE=""
NXMOT S LAST=TYPE
 S COUR=COUR+1
 G:COUR>FIN FIN
 S TYPE=@GLO@(COUR),VAL=@TRAD@(COUR)
 G:TYPE="ATTRIBUT" ATTR
 G:TYPE="ATTRIBUT.TEMPORAIRE" ATTR
 G:TYPE="CONSTANTE.NUMERIQUE" CSTTE
 G:TYPE="CONSTANTE.ALPHA" CSTTE
 G:TYPE="(" PAROUV
 G:TYPE=")" PARFER
 G:TYPE="VERBE" VERBE
 G:TYPE=";" PTVIR
 G:TYPE="^" CHEM
 G:TYPE="OPERATEUR.BINAIRE" OPEBIN
 G:TYPE="OPERATEUR.UNAIRE" OPEUNA
 G:TYPE="OPERATEUR.BINAIRE.OU.UNAIRE" OPEBU
 G:(TYPE="=")&(NATURE="CONDITION") OPEBIN
 I (TYPE="=")&(NATURE="ACTION") S TYPE="AFFECT" G OPEBIN
 G:(TYPE="ET")!(TYPE="OU") OPEBIN
 G:TYPE="COMMENT" FIN
 G ERR
 
ATTR F OTT="ATTRIBUT","ATTRIBUT.TEMPORAIRE","CONSTANTE.ALPHA","CONSTANTE.NUMERIQUE",")" G:OTT=LAST ERR
 D PUSH(POLO,TYPE,VAL,"")
 G NXMOT
 
CSTTE F OTT="ATTRIBUT","ATTRIBUT.TEMPORAIRE","CONSTANTE.ALPHA","CONSTANTE.NUMERIQUE",")" G:OTT=LAST ERR
 D PUSH(POLO,TYPE,VAL,"")
 G NXMOT
 
PAROUV D PUSHOP(TYPE,VAL,"")
 I (LAST="ATTRIBUT")!(LAST="ATTRIBUT.TEMPORAIRE") D PUSHOP("indice","indice","")
 G NXMOT
 
PARFER F %I=0:0 Q:@PILEOP=0  S OPE=@PILEOP@(@PILEOP) Q:OPE="("  D RECOP
 G:@PILEOP=0 ERR
 K @PILEOP@(@PILEOP) S @PILEOP=@PILEOP-1
 G:@PILEOP=0 NXMOT
 I @PILEOP@(@PILEOP)="VERBE" S @PILEOP@(@PILEOP,"INFO")=@PILEOP@(@PILEOP,"INFO")+1
 G NXMOT
 
 
OPEBIN D:$$TOP="chemin" RECOP
 D PUSHOP(TYPE,VAL,"")
 G NXMOT
 
OPEUNA 
 D:$$TOP="chemin" RECOP
 D PUSHOP(TYPE,VAL,"")
 G NXMOT
 
 
OPEBU D:$$TOP="chemin" RECOP
 F OTT="ATTRIBUT","ATTRIBUT.TEMPORAIRE","CONSTANTE.ALPHA","CONSTANTE.NUMERIQUE",")" G:OTT=LAST OPEBUB
 D PUSHOP("OPERATEUR.UNAIRE",VAL,"")
 G NXMOT
OPEBUB D PUSHOP("OPERATEUR.BINAIRE",VAL,"")
 G NXMOT
 
VERBE D:$$TOP="chemin" RECOP
 D PUSHOP(TYPE,VAL,0)
 G NXMOT
 
CHEM D:$$TOP="chemin" RECOP
 D PUSHOP("chemin",VAL,0)
 G NXMOT
 
PTVIR F %I=0:0 Q:@PILEOP=0  S OPE=@PILEOP@(@PILEOP) Q:OPE="("  D RECOP
 G:@PILEOP=0 ERR
 S ADRVRB=@PILEOP-1
 G:ADRVRB=0 ERR
 I @PILEOP@(ADRVRB)'="VERBE" G ERR
 S @PILEOP@(ADRVRB,"INFO")=@PILEOP@(ADRVRB,"INFO")+1
 G NXMOT
 
FIN S OPE="" F %I=0:0 Q:@PILEOP=0  S OPE=@PILEOP@(@PILEOP) Q:OPE="("  D RECOP
 G:OPE="(" ERR
 Q
 
 
ERR S RES=0
 Q
 
INIPILE(POLO) K @(POLO) S @POLO=0 Q
PILEVIDE(POLO) Q:'($D(@POLO)) 1 Q:@POLO=0 1 Q 0
PUSH(POLO,TYPE,VAL,INFO) 
 S @POLO=@POLO+1
 S @POLO@(@POLO)=TYPE
 S @POLO@(@POLO,"VAL")=VAL
 S @POLO@(@POLO,"INFO")=INFO
 Q
PULL(POLO,TYPE,VAL,INFO) 
 S TYPE=@POLO@(@POLO),VAL=@POLO@(@POLO,"VAL"),INFO=@POLO@(@POLO,"INFO")
 S @POLO=@POLO-1 Q
PUSHOP(TYPE,VAL,INFO) 
 S @PILEOP=@PILEOP+1
 S @PILEOP@(@PILEOP)=TYPE
 S @PILEOP@(@PILEOP,"VAL")=VAL
 S @PILEOP@(@PILEOP,"INFO")=INFO
 Q
PULLOP(TYPE,VAL,INFO) 
 S TYPE=@PILEOP@(@PILEOP),VAL=@PILEOP@(@PILEOP,"VAL"),INFO=@PILEOP@(@PILEOP,"INFO")
 S @PILEOP=@PILEOP-1 Q
 
RECOP D PUSH(POLO,@PILEOP@(@PILEOP),@PILEOP@(@PILEOP,"VAL"),@PILEOP@(@PILEOP,"INFO"))
 K @PILEOP@(@PILEOP) S @PILEOP=@PILEOP-1
 Q
 
TOP() N RES Q:@PILEOP=0 "" S RES=@PILEOP@(@PILEOP) Q RES

