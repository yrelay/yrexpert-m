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

;%TLIMPRI^INT^1^59547,74029^0
%TLIMPRI(T) 
 
 
 
 
 
 N C,I
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("Impression du traitement ? : "),"O")=1 G 79
 D POCLEPA^%VVIDEO Q
79 D MSG^%VZEATT($$^%QZCHW("Impression en cours ... un instant"))
 D IMPR(T)
 D ^%VZEAVT($$^%QZCHW("Impression terminee ")) Q
 
IMPR(T) N L,LMAX,LNO,P,PAGE,LGMAX
 S P=^TABIDENT(WHOIS,"PRINTER"),LMAX=^TABIDENT(WHOIS,"IMPRCOUR")
 S LGMAX=$$^%QCAZG("^TABIDENT(WHOIS,""TYPTAB"")")
 S LGMAX=$S(LGMAX="KYO":76,LGMAX="HP-KYO":76,LGMAX="POSTSCRIPT":76,LGMAX="KYOCERA F-1010":76,1:200)
 
 S LNO=0,PAGE=0 C P D OPENDEV^%SYSUTI1(P) U P D TETE,TRAIT U P W # C P U 0
 Q
 
TRAIT W !,$$^%QZCHW("Commentaires"),! S LNO=LNO+2
 F L=1:1:$ZP(^[QUI]TTL(T,1,"")) D IMPL(^[QUI]TTL(T,1,L))
 W !,! S LNO=LNO+2 D:LNO>(LMAX-5) TETE
 W !,$$^%QZCHW("Traitement sur chaque individu"),! S LNO=LNO+2
 F L=1:1:$ZP(^[QUI]TTL(T,2,"")) D IMPL(^[QUI]TTL(T,2,L))
 Q
TETE S PAGE=PAGE+1
 W #,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE
 I LGMAX=200 W ?40,$$^%QZCHW("Traitement : "),T G STETE
 N LTR,NBC
 S LTR=$$^%QZCHW("Traitement : ")_T
 S NBC=76-$L(LTR) S:NBC'>0 NBC=1
 W ?NBC,LTR
STETE W !,$$^%QZCHW("Page : "),PAGE
 W !,!
 S LNO=4
 Q
 
IMPL(TE) W !,"  ",$E(TE,1,LGMAX) S LNO=LNO+1 D:LNO>(LMAX-5) TETE
 Q:$L(TE)'>LGMAX
 N DEB S DEB=LGMAX+1
BOUCI W !,"  ",$E(TE,DEB,DEB+LGMAX) S LNO=LNO+1 D:LNO>(LMAX-5) TETE
 Q:$E(TE,(DEB+LGMAX)+1)=""
 S DEB=(DEB+LGMAX)+1
 G BOUCI

