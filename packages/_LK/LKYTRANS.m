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

;LKYTRANS^INT^1^59547,74868^0
LKYTRANS ;
 
 
 
 
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,2,1,0,"Recuperation pass. suite de valeurs")
 D POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI("Ok pour la recuperation ? ","O")) D POCLEPA^%VVIDEO Q
 D POCLEPA^%VVIDEO
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,2,1,0,"Passerelles de sortie")
 S CONT="S DY=DY+1,DX=0 I DY>22 S DX=0,DY=4 D CLEBAS^%VVIDEO"
 S DX=0,DY=3
 S PAS=""
BSORT X CONT
 S PAS=$O(^[QUI]LKY(PAS))
 G:PAS="" ENTR
 G:((PAS="EC")!(PAS="EC2"))!(PAS="EC3") BSORT
 X XY W PAS
 X CONT
 S ^[QUI]LKY2(PAS)=^[QUI]LKY(PAS)
 S REP=$P(^[QUI]LKY(PAS),"^",3)
 I REP="" D ^%VSQUEAK W "Repertoire non precise !!!" R *R
 D GLOCOP^%QCAGLC("^[QUI]LKYENRD("""_PAS_""")","^[QUI]LKYENR2("""_PAS_""")")
 S REPS=""
BSORT2 S REPS=$O(^[QUI]LKYATR(PAS,REPS))
 G:REPS="" BSORT
 S LIEN=$S(REPS=REP:"",1:"~"_REPS)
 S ATR=""
BSORT3 S ATR=$O(^[QUI]LKYATR(PAS,REPS,ATR))
 G:ATR="" BSORT2
 D GLOCOP^%QCAGLC("^[QUI]LKYATR("""_PAS_""","""_REPS_""","""_ATR_""")","^[QUI]LKYATR2("""_PAS_""","""_ATR_LIEN_""")")
 X XY W ATR X CONT
 G BSORT3
 
 
ENTR D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,2,1,0,"Passerelles en entree")
 S DY=23
 X CONT
BENT S PAS=$O(^[QUI]LKY("EC",PAS))
 G:PAS="" AVERT
 X XY W PAS X CONT
 G:$D(^[QUI]LKY2(PAS)) PROT
 S Y=^[QUI]LKY("EC",PAS)
 S ^[QUI]LKY2(PAS)=1_"^"_$P(Y,"^",4)_"^"_$P(Y,"^",2)_"^"
 S ^[QUI]LKYENR2(PAS,1)=$P(Y,"^")
 S ATR=""
BENT2 S ATR=$O(^[QUI]LKY("EC3",PAS,ATR))
 G:ATR="" PROT
 S Y=^[QUI]LKY("EC3",PAS,ATR)
 W *
PROT 
 G:'($D(^[QUI]LKY("EC2",PAS))) BENT
 D GLOCOP^%QCAGLC("^[QUI]LKY(""EC2"","""_PAS_""")","^[QUI]LKYPROT("""_PAS_""")")
 G BENT
 
AVERT D POCLEPA^%VVIDEO
 D ^%VSQUEAK
 W "ATTENTION !!! N'oubliez pas de valider ces nouvelles passerelles ..." R *R
 Q

