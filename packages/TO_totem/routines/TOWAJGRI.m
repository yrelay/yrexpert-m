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

;TOWAJGRI^INT^1^59547,74876^0
TOWAJGRI ;
 S %AJCMS=$$^%QZCHW("Ajout")
LOOP S %AJCMS=$$^%QZCHW("Ajout"),CMS=0,SCR=NOMG,NOMTAB="^[QUW]SAISIGAM"
 D CLEPAG^%VVIDEO,^%ABACTS2 G END:ABENDSCR=1
 D ^TOWAUTST S %ALL=RESUL(1),%ETAT=RESUL(2),%LARG=RESUL(3)
 
FS D POCLEPA^%VVIDEO U 0
 
 Q
CONNU Q:%DOS=1  S OICC=ICC,REFUSE=0 G INCON:(RESUL(1)="")!(RESUL(2)="")
 I '($D(^[QUW]RAG(RESUL(1),RESUL(2)))) S CONNU=0 G INCON
 S %NAI=-1,OKN=0 F IN=0:0 Q:OKN=1  S %NAI=$N(^[QUW]RAG(RESUL(1),RESUL(2),%NAI)) G:%NAI=-1 FIN D REP
 Q
REP S REFUSE=1 D POCLEPA^%VVIDEO W %NAI,$$^%QZCHW(" est sa date de naissance (O/N) ? ") R *REP G:(REP'=$A($$^%QZCHW("O")))&(REP'=$A($$^%QZCHW("N"))) REP D POCLEPA^%VVIDEO I $C(REP)=$$^%QZCHW("O") S OKN=1,REFUSE=0,DOS=$N(^[QUW]RAG(RESUL(1),RESUL(2),%NAI,-1)),%NAME=RESUL(1),%PREN=RESUL(2) D ^CGETPROF
FIN S ICC=OICC Q
INCON S REFUSE=1 D POCLEPA^%VVIDEO W $$^%QZCHW(" Patient(e) inconnu(e) ,composer nom ET prenom exacts") G FIN
END Q

