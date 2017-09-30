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

;%QSMOVI2^INT^1^59547,73882^0
%QSMOVI2 ;;11:52 AM  5 May 1993; ; 05 May 93  4:11 PM
 
 
 
 
TRTTRT(TP) N TY,OB,TRAIT
 S MODG=0,OKU=1,REAF=1
 S OB=@TP@("O")
 S TY=$E(OB) I TY'="r" D ^%VZEAVT($$^%QZCHW("Vous n'etes pas sur un repertoire ")) Q
 S OB=$E(OB,3,$L(OB))
 S R=1
 S TRAIT=$$GET^%TLDIAL2("Traitement : ",.R)
 Q:TRAIT=""
 D MEM^%QCAMEM
 K (QUI,WHOIS,TY,OB,MODEL,TRAIT) D CURRENT^%IS,VARSYS^%QCSAP
 D ACTIV($$NOMINT^%QSF(OB))
TRTCTRBF 
 D RMEM^%QCAMEM Q
 Q
 
 
 
ACTIV(BASI) 
 I $$REPVID^%QSGEST5(BASI) D ^%VZEAVT($$^%QZCHW("Ensemble vide ")) Q
L0 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(BASI),1,"",21,4,59,7)
L1 D ALLREV^%VZCD(21,79,3,3,"",0,$$^%QZCHW("individu a traiter"))
 D AFF^%QUCHOIP
L2 S OBJ=$$UN^%QUCHOIP I OBJ="" D END^%QUCHOIP Q
 S R=$$CONTEXT^%TLIACUN(TRAIT,BASI,OBJ,0,0,0,.CXT,.ABANDON)
 I '($$IR^%QSGE5(BASI,OBJ)) D END^%QUCHOIP G L0
 G L1
 ;
 ;

