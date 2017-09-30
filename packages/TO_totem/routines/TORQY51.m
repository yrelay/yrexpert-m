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

;TORQY51^INT^1^59547,74875^0
TORQY51 ;
 
INIT 
 N I,LIB,L
 G:$D(^[QUI]RQSGLO("TODKBMS","CONFIG"))'=11 INICONF
 S I=1
 F LIB="ODUP","ATDUP","ODUN","ATDUN","OCOUT","ATCOU","OCO1","ATCO1","OCO2","ATCO2","ODI1","ATDI1","ODI2","ATDI2" S @(LIB_"="""_^[QUI]RQSGLO("TODKBMS","CONFIG",I)_""""),I=I+1
 Q
 
INICONF S ODUP=1,ATDUP="TEMPS.PREPARATION",ODUN=1,ATDUN="TEMPS.FABRICATION"
 S OCOUT=1,ATCOU="COUT.TOTEM",OCO1=1,ATCO1="CONSIGNE"
 S OCO2=1,ATCO2="COMMENTAIRE",ODI1=1,ATDI1="DIMENSION.A.L.OUTIL"
 S ODI2=1,ATDI2="COMMENTAIRE"
 S (L,^[QUI]RQSGLO("TODKBMS","CONFIG"))="O^TEMPS.PREPARATION^O^TEMPS.FABRICATION^O^COUT.TOTEM^O^CONSIGNE^O^COMMENTAIRE^O^DIMENSION.A.L.OUTIL^O^COMMENTAIRE"
 F I=2:2:14 S ^[QUI]RQSGLO("TODKBMS","CONFIG",I)=$P(L,"^",I)
 F I=1:2:14 S ^[QUI]RQSGLO("TODKBMS","CONFIG",I)=1
 Q
DUREE 
 S OP=$O(^[QUI]DUREE(NUFA,TWREF,""))
 F DU=1:1 Q:OP=""  D DURE S OP=$O(^[QUI]DUREE(NUFA,TWREF,OP))
 Q
 
DURE 
 D:'($D(ATDUP)) INIT
 S TT=^[QUI]DUREE(NUFA,TWREF,OP)
 S VATT=$J($P(TT,"^",1),0,4),VATT2=$J($P(TT,"^",2),0,4) S:'($D(OPE)) OPE=%CUK_","_OP
 D:ODUP PA^%QSGESTI(BASFI,OPE,ATDUP,VATT,1)
 D:ODUN PA^%QSGESTI(BASFI,OPE,ATDUN,VATT2,1)
 Q
 
DIME 
 S OP=$O(^[QUI]DIM(NUFA,TWREF,""))
 F DI=1:1 Q:OP=""  D DIM1 S OP=$O(^[QUI]DIM(NUFA,TWREF,OP))
 
DIM1 
 S OR="" F D=1:1 S OR=$O(^[QUI]DIM(NUFA,TWREF,OP,OR)) Q:OR=""  D DIM
 Q
 
DIM D:'($D(ATDI1)) INIT
 S TT=^[QUI]DIM(NUFA,TWREF,OP,OR)
 S VATT=$P(TT,"|",1)_" : "_$P(TT,"|",2) S:'($D(OPE)) OPE=%CUK_","_OP
 D:ODI1 PA^%QSGESTI(BASFI,OPE,ATDI1,VATT,OR)
 D:ODI2 PA^%QSGESTI(BASFI,OPE,ATDI2,VATT,NCOM) S NCOM=NCOM+1 Q
 
 
CONFIG N RESUL,SCR,PATOUCH,I,LIB,OUI,ABENSCR,DEFAUT,CMS,NOMTAB
 S OUI=$E($$^%QZCHW("OUI")),NOMTAB=""
 S SCR="TORQYAT",ABENDSCR=0,CMS=0
 D CLEPAG^%VVIDEO,^%VAFIGRI
 D READCON,^%VAFISCR
 D ^%VMODISC
 G:ABENDSCR FCONF
 
 F I=1:1:14 S RESUL(I)=$$GETLBLAN^%VTLBLAN(RESUL(I)) S:RESUL(I)="" RESUL(I)=DEFAUT(I)
 S LIB=""
 F I=1:1:14 S LIB=LIB_RESUL(I)_"^"
 S ^[QUI]RQSGLO("TODKBMS","CONFIG")=LIB
 F I=2:2:14 S ^[QUI]RQSGLO("TODKBMS","CONFIG",I)=RESUL(I)
 F I=1:2:14 S ^[QUI]RQSGLO("TODKBMS","CONFIG",I)=RESUL(I)=OUI
FCONF D CLEPAG^%VVIDEO
 Q
 
READCON 
 
 F I=1:2:14 S DEFAUT(I)=OUI
 S DEFAUT(2)="TEMPS.PREPARATION",DEFAUT(4)="TEMPS.FABRICATION"
 S DEFAUT(6)="COUT.TOTEM",DEFAUT(8)="CONSIGNE"
 S DEFAUT(10)="COMMENTAIRE"
 S DEFAUT(12)="DIMENSION.A.L.OUTIL",DEFAUT(14)="COMMENTAIRE"
 G:$D(^[QUI]RQSGLO("TODKBMS","CONFIG"))=11 READCO2
 F I=1:1:14 S RESUL(I)=DEFAUT(I)
 Q
 
READCO2 S LIB=^[QUI]RQSGLO("TODKBMS","CONFIG")
 F I=1:1:14 S RESUL(I)=$S($P(LIB,"^",I)="":DEFAUT(I),1:$P(LIB,"^",I))
 Q
 ;
 ;
 ;

