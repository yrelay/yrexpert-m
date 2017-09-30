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

;%EDFIMPR^INT^1^59547,73869^0
%EDFIMPR(M) 
 
 
 
 
 N L,LMAX,PAGE,%PORT,LGMAX
 S %PORT=^TABIDENT(WHOIS,"PRINTER"),PAGE=0
 D PARAMS^%QCSAP(%PORT,.TAB)
 Q:'(TAB)
 S LMAX=^TABIDENT(WHOIS,"IMPRCOUR")
 S LGMAX=$$^%QCAZG("^TABIDENT(WHOIS,""TYPTAB"")")
 S LGMAX=$S(LGMAX="KYO":76,LGMAX="HP-KYO":76,LGMAX="POSTSCRIPT":76,LGMAX="KYOCERA F-1010":76,1:200)
 
 I '($$^%EDPRLG) Q
 U %PORT
 D TETE,IMPR
 
 D ^%EDEPLG
 Q
 
IMPR S I="" F %I=0:0 S I=$O(^[QUI]EDFORMAT(M,"LIGNES",I)) Q:I=""  D:L>(LMAX-5) TETE D IMPL(^[QUI]EDFORMAT(M,"LIGNES",I))
 W #
 Q
 
TETE S PAGE=PAGE+1
 W #,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE
 I LGMAX=200 W ?40,$$^%QZCHW("Format de document : "),M G STETE
 N LTR,NBC
 S LTR=$$^%QZCHW("Format de document : ")_M
 S NBC=76-$L(LTR) S:NBC'>0 NBC=1
 W ?NBC,LTR
STETE W !,$$^%QZCHW("Page : "),PAGE
 W !,!
 S L=4
 Q
 
IMPL(TE) 
 W !,"  ",$E(TE,1,LGMAX) S L=L+1
 D:L>(LMAX-5) TETE
 Q:$L(TE)'>LGMAX
 N DEB S DEB=LGMAX+1
BOUCI W !,"  ",$E(TE,DEB,DEB+LGMAX) S L=L+1
 D:L>(LMAX-5) TETE
 Q:$E(TE,(DEB+LGMAX)+1)=""
 S DEB=(DEB+LGMAX)+1
 G BOUCI
 ;

