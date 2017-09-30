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

;%QSGES19^INT^1^59547,73881^0
QSGES19 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
BIENFORME(NOM,TX) 
 N L,OB1,OB2,REPL1,REPL2,REPI1,REPI2,ORD1,REPID
 I NOM="" S TX=$$^%QZCHW("le nom est egal a la chaine vide") Q 0
 S L=$P(NOM,"\\"),OB1=$P(NOM,"\\",2),ORD1=$P(NOM,"\\",4)
 S OB2=$P(NOM,"\\",3)
 I L="" S TX=$$^%QZCHW("determination du nom du lien impossible") Q 0
 D LIENR^%QSGEL2(L,.REPI1,.REPI2)
 I (REPI1="")!(REPI2="") S TX=$$^%QZCHW("   Impossible de determiner les 2 repertoires lies par cet attribut") Q 0
 S REPL1=$$NOMLOG^%QSF(REPI1),REPL2=$$NOMLOG^%QSF(REPI2)
 I OB1="" S TX=$$^%QZCHW("   Determination du nom de l'individu source impossible") Q 0
 I OB2="" S TX=$$^%QZCHW("   Determination du nom de l'individu destination impossible") Q 0
 I ORD1="" S TX=$$^%QZCHW("   Determination du numero d'ordre impossible") Q 0 I REPL1="" S TX=$$^%QZCHW("   Repertoire source inconnu") Q 0
 I REPL2="" S TX=$$^%QZCHW("   Repertoire destination inconnu") Q 0
 I '($$IR^%QSGE5(REPI1,OB1)) S TX=$$^%QZCHW("   Objet source inconnu dans son repertoire") Q 0
 I '($$IR^%QSGE5(REPI2,OB2)) S TX=$$^%QZCHW("   Objet destination inconnu dans son repertoire") Q 0
 S OB2=$$NOMEX^%QSGES10(REPI2,OB2)
 I '($$VAIR^%QSGE5(REPI1,OB1,L,OB2)) S TX=$$^%QZCHW("   L'individu destination n'est pas lie avec l'individu source") Q 0
 I '($$OVAIR^%QSGE5(REPI1,OB1,L,OB2,ORD1)) S TX=$$^%QZCHW("   Le numero d'ordre est incorrect") Q 0
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERNOM(NOM) 
 N L,OB1,OB2,REPI1,REPI2,ORD1
 S L=$P(NOM,"\\"),OB1=$P(NOM,"\\",2),OB2=$P(NOM,"\\",3)
 S ORD1=$P(NOM,"\\",4)
 D LIENR^%QSGEL2(L,.REPI1,.REPI2)
 Q:(REPI1="")!(REPI2="")
 D CREERL^%QSGES20(REPI1,OB1,ORD1,L,REPI2,OB2)
 Q
 
 
 
 
 
 
 
 
 
PATOUCH(GLO) 
 N %U
 F %U="NOM","NOM.LIEN","NUMERO.ORDRE","OBJET.DESTINATION","OBJET.SOURCE","REP.DESTINATION","REP.SOURCE","SOURCE.COMPOSE.DE","DESTINATION.COMPOSE.DE" S @GLO@(%U)=""
 Q

