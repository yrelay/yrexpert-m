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

;LKRBFM1^INT^1^59547,74867^0
LKRBFM1 ;;03:26 PM  20 May 1992;
 
 
 N REP,FILE,RACINE,LIEN
 S REP="ARTICLE",LIEN="COMPOSE.DE"
 D CLEPAG^%VVIDEO
 S FILE=""
 D LIRE2^%VREAD($$^%QZCHW("Fichier")_"    :",FILE,2,75,6,7,"","",.CTR,.FILE)
 Q:FILE=""
 S RACINE=""
 D LIRE2^%VREAD($$^%QZCHW("Racine")_"     :",RACINE,2,75,8,9,"","",.CTR,.RACINE)
 D LOAD(FILE,REP,RACINE,LIEN)
 Q
 
 
TEST N REP,FILE,RACINE,LIEN
 S REP="ARTICLE",FILE="C:\VE_132",RACINE="1147328545580",LIEN="COMPOSE.DE"
 D LOAD(FILE,REP,RACINE,LIEN)
 Q
 
LOAD(FILE,REP,RACINE,LIEN) 
 N REPLIEN,TABRACI,x,NIV,I,NOM,DESI,NUMPLAN,UNITE,TA,NUMVAR,PREMOP,AJS
 N DATEDEB,DATEFIN,MSG,INDLIEN
 S REPLIEN=$$LIENI^%QSGEL3
 O 10:(MODE="r":FILE=FILE)
 S TABRACI(0)=RACINE
 I '($$IR^%QSGE5(REP,RACINE)) S RES=$$CREER^%QSGEIND(REP,RACINE,"",1,.MSG)
l1 U 10 R x I $L(x)'>0 C 10 Q
 G:$E(x)'="." l1
 S NIV=$E(x,1,15)
 S NIV=$$GETLBLAN^%VTLBLAN(NIV)
 F I=1:1 Q:$E(NIV)'="."  S NIV=$E(NIV,2,$L(NIV))
 S NOM=$$GETLBLAN^%VTLBLAN($E(x,17,31))
 S TABRACI(NIV)=NOM
 S DESI=$$GETLBLAN^%VTLBLAN($E(x,33,63))
 S NUMPLAN=$$GETLBLAN^%VTLBLAN($E(x,64,86))
 S QTTE=$$GETLBLAN^%VTLBLAN($E(x,87,94)),QTTE=$TR(QTTE,",",".")
 S UNITE=$$GETLBLAN^%VTLBLAN($E(x,95,96))
 S TA=$$GETLBLAN^%VTLBLAN($E(x,97,100))
 S NUMVAR=$$GETLBLAN^%VTLBLAN($E(x,101,105))
 S PREMOP=$$GETLBLAN^%VTLBLAN($E(x,106,110))
 S AJS=$$GETLBLAN^%VTLBLAN($E(x,111,115))
 S DATEDEB=$$GETLBLAN^%VTLBLAN($E(x,116,126))
 S DATEFIN=$$GETLBLAN^%VTLBLAN($E(x,127,133))
 U 0 W !,DESI,"   ",NUMPLAN,"   ",QTTE
 I '($$IR^%QSGE5(REP,NOM)) S RES=$$CREER^%QSGEIND(REP,NOM,"",1,.MSG)
 D PA^%QSGESTI(REP,NOM,"DESIGNATION",DESI,1)
 D PA^%QSGESTI(REP,NOM,"NUMERO.PLAN",NUMPLAN,1)
 D PA^%QSGESTI(REP,NOM,"UNITE",UNITE,1)
 
 G:NIV=0 l1
 
 S INDLIEN=$$NOML1^%QSGES20(TABRACI(NIV-1),NOM,LIEN,NOM)
 I INDLIEN="" D ADDS^%QSGES26(REP,TABRACI(NIV-1),LIEN,REP,NOM) S INDLIEN=$$NOML1^%QSGES20(TABRACI(NIV-1),NOM,LIEN,NOM)
 G:INDLIEN="" l1
 D PA^%QSGESTI(REPLIEN,INDLIEN,"QUANTITE",QTTE,1)
 D PA^%QSGESTI(REPLIEN,INDLIEN,"UNITE",UNITE,1)
 G l1

