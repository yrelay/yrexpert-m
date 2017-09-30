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

;%QMEXCMP^INT^1^59547,73878^0
%QMEXCMP ;;02:11 PM  26 Apr 1993; 14 Oct 92  5:03 PM ; 30 Apr 93 11:07 AM
 
 
 
 
 
ANARESO(TOUS,LISTE) 
 N AVECARBO,MENU1,CONTR,AVECPRED,MENU1
 N LRESO,LPRED,LTRT,LREQ,LMOD,LFOR,LPSV
 S LRESO=$$TEMP^%SGUTIL
 D CLEPAG^%VVIDEO
 S MENU1(1)=$$^%QZCHW("OUI")_"^1",MENU1(2)=$$^%QZCHW("NON")_"^0"
 I TOUS S AVECARBO=0 G ANA2
 U 0 S DX=4,DY=8 X XY W $$^%QZCHW("Comprehension des reseaux associes ?")
 D ^%VQUIKMN(35,70,9,"MENU1",.AVECARBO,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 S:AVECARBO'=0 AVECARBO=1
ANA2 U 0 S DX=4,DY=11 X XY W $$^%QZCHW("Compilation des predicats de transitions")
 D ^%VQUIKMN(35,78,12,"MENU1",.AVECPRED,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 S:AVECPRED'=0 AVECPRED=1
 
 U 0 S DX=4,DY=14 X XY W $$^%QZCHW("Reanalyse des requetes de contexte ?")
 D ^%VQUIKMN(35,78,15,"MENU1",.AVECREQ,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 S:AVECREQ'=0 AVECREQ=1
 
 U 0 S DX=4,DY=17 X XY W $$^%QZCHW("Reanalyse des traitements et des elements qu'ils appellent ?")
 D ^%VQUIKMN(35,78,18,"MENU1",.AVECTRT,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 S:AVECTRT'=0 AVECTRT=1
 S LREQ=$$TEMP^%SGUTIL,LPRED=$$TEMP^%SGUTIL,LTRT=$$TEMP^%SGUTIL
 S LMOD=$$TEMP^%SGUTIL,LFOR=$$TEMP^%SGUTIL,LPSV=$$TEMP^%SGUTIL
 S RESO="" F %R=0:0 S RESO=$O(@LISTE@(RESO)) Q:RESO=""  D ARBRESO(RESO,AVECARBO,LRESO,AVECPRED,LPRED,AVECREQ,LREQ,AVECTRT,LTRT,LMOD,LFOR,LPSV)
 
 D ON^%VZEATT
 D ANALENS(LRESO,LPRED,LREQ,LTRT,LMOD,LFOR,LPSV,1)
 D OFF^%VZEATT
 K @(LPRED),@(LREQ),@(LTRT),LMOD,LFOR,LPSV
 Q
 
 
 
 
 
 
 
 
ARBRESO(RESO,AVECARBO,LISTE,AVECPRED,LPRED,AVECREQ,LREQ,AVECTRT,LTRT,LMOD,LFOR,LPSV) 
 N VU,REPATN,LIEN,FILE,IFIL,NOMATN,INODE,%INODE,REPLIEN,NOMLIEN,ICOND
 S REPATN=$$NOMINT^%QSF("RESEAU"),REP=$$NOMINT^%QSF("ETAT.RESEAU")
 S LIEN="ETAT.PRECEDE",REPLIEN=$$LIENI^%QSGEL3
 S FILE=$$TEMP^%SGUTIL
 S @FILE=1,@FILE@(1)=RESO,IFIL=""
NXFIL S IFIL=$O(@FILE@(IFIL)) G:IFIL="" ARBF
 S NOMATN=@FILE@(IFIL) G:$D(@LISTE@(NOMATN)) NXFIL
 D POCLEPA^%VVIDEO,MSG^%VZEATT($$^%QZCHW("reseau")_" "_NOMATN)
 S INODE="" F %INODE=0:0 S INODE=$$NXTRIAO^%QSTRUC8(REPATN,NOMATN,"ETAT.RESEAU",INODE) Q:INODE=""  S NODE=$$VALEUR^%QSTRUC8(REPATN,NOMATN,"ETAT.RESEAU",INODE) D TRTN
 S @LISTE@(NOMATN)=""
 G NXFIL
ARBF D POCLEPA^%VVIDEO
 K @(FILE)
 Q
 
TRTN S ND=NOMATN_","_NODE
 G:'(AVECARBO) LIEN
 S ATNASSO=$$^%QSCALIN(REP,ND,"RESEAU.ASSOCIE",1)
 I ATNASSO'="",'($D(@LISTE@(ATNASSO))) S @FILE=@FILE+1,@FILE@(@FILE)=ATNASSO
LIEN G:'(AVECPRED) FLIE
 
 S LIE=""
BCLLIE S LIE=$$NXTRIAO^%QSTRUC8(REP,ND,LIEN,LIE) G:LIE="" FLIE
 S NOMLIEN=$$NOML1^%QSGES20(ND,LIE,LIEN,LIE) G:NOMLIEN="" BCLLIE
 S ICOND=""
BCLLI S ICOND=$$NXTRIAO^%QSTRUC8(REPLIEN,NOMLIEN,"PREDICAT",ICOND) G:ICOND="" BCLLIE
 S VAL=$$VALEUR^%QSTRUC8(REPLIEN,NOMLIEN,"PREDICAT",ICOND),@LPRED@(VAL)=""
 G BCLLI
FLIE 
 I AVECREQ,$$^%QSCALIN(REP,ND,"CONTEXTE.D.ACTIVATION",1)="REQUETE" S VAL=$$^%QSCALIN(REP,ND,"CONTEXTE.D.ACTIVATION",2) S:VAL'="" @LREQ@(VAL)=""
 G:'(AVECTRT) S20
 S ORD="" F %O=0:0 S ORD=$$NXTRIAO^%QSTRUC8(REP,ND,"REGLE",ORD) Q:ORD=""  S VAL=$$VALEUR^%QSTRUC8(REP,ND,"REGLE",ORD) I $P(VAL,"\")="TRAITER" S VAL=$P(VAL,"\",2) I VAL'="" S @LTRT@(VAL)="" D TRT^%QULELT1("t."_VAL,LTRT,LMOD,LFOR,LREQ,LPSV)
S20 
 Q
 
 
 
 
 
 
 
 
ANALENS(LCOMPI,LPRED,LREQ,LTRT,LMOD,LFOR,LPSV,VISU) 
 N REP,LIEN,FILE,VU,GLOAT,NOMLIEN,GLOSTO,REPLIEN,NDEP,CTR,Y1,GNODE,INODE,%INODE,NODE,REPATN,O,NOMATN,OBJ,%O,ICOUR,%II,XX,LCH,RES
 I VISU D CLEPAG^%VVIDEO S ICOUR=1 F %II=1:1:8 S XX(%II)=" "
 S REPATN="RESEAU",REP=$$NOMINT^%QSF("ETAT.RESEAU")
 S LCH=$$^%QZCHW("du reseau"),RES=1
 S OBJ="" F %O=1:1 S OBJ=$O(@LCOMPI@(OBJ)) Q:OBJ=""  D PROLA S NDEP=$$^%QSCALIN("RESEAU",OBJ,"NOEUD.INITIAL",1) I NDEP'="" S NOMATN=OBJ D MAKE2^%QMEXATN,EPILA
 S LCH=$$^%QZCHW("du predicat")
 S OBJ="" F %O=0:0 S OBJ=$O(@LPRED@(OBJ)) Q:OBJ=""  D PROLA S RES=$$ANALYSE^%PSPRGES(OBJ) D EPILA
 S LCH=$$^%QZCHW("du traitement")
 S OBJ="" F %O=0:0 S OBJ=$O(@LTRT@(OBJ)) Q:OBJ=""  D PROLA S RES=$$^%TLIANAL(OBJ,0,0,.Y1) D EPILA
 S LCH=$$^%QZCHW("de la requete")
 S OBJ="" F %O=0:0 S OBJ=$O(@LREQ@(OBJ)) Q:OBJ=""  D PROLA S RES=$$ANALYSER^%QSINTER(OBJ) D EPILA
 S LCH=$$^%QZCHW("du modele")
 S OBJ="" F %O=0:0 S OBJ=$O(@LMOD@(OBJ)) Q:OBJ=""  D PROLA S RES=$$^%EDMANAL(OBJ,0) D EPILA
 S LCH=$$^%QZCHW("du format")
 S OBJ="" F %O=0:0 S OBJ=$O(@LFOR@(OBJ)) Q:OBJ=""  D PROLA S RES=$$^%EDFANAL(OBJ,0) D EPILA
 S LCH=$$^%QZCHW("de la passerelle")
 S OBJ="" F %O=0:0 S OBJ=$O(@LPSV@(OBJ)) Q:OBJ=""  D PROLA S RES='($$VALID^LKYVALI(OBJ,0)) D EPILA
 Q
 
 
 
PROLA G:ICOUR>8 PROLAC
 S ICOUR=ICOUR+1
 S XX(ICOUR)=$E($$^%QZCHW("Analyse")_" "_LCH_" "_OBJ,1,65)
 F %II=1:1:ICOUR D LIGA(%II)
 Q
PROLAC F %II=1:1:8 S XX(%II)=XX(%II+1)
 S XX(9)=$E($$^%QZCHW("Analyse")_" "_LCH_" "_OBJ,1,65)
 F %II=1:1:9 D LIGA(%II)
 Q
EPILA S XX(ICOUR)=XX(ICOUR)_" ("_$S(RES:"OK",1:$$^%QZCHW("Probleme"))_")" D LIGA(ICOUR) Q
 
LIGA(I) U 0 S DX=4,DY=8+I X XY W $J(" ",74) X XY W XX(I) Q
 ;

