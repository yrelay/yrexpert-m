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

;%ABGRGRI^INT^1^59547,73864^0
%ABGRGRI ;
 
 S %GO=0,REF=^TACOMPIL($I,%IP,%IL) G DEB
BEG S %GO=1
DEB S (SCR,NOMG)=$P(REF,"^",1),%NORM=$P(REF,"^",2),%IDENT=$P(REF,"^",3),TYP=$P(REF,"^",4),QUW=$S(TYP["P":QUI,1:QUCOM),QU=QUW K REF,TYP
 S RESUL(1)=NOMG,RESUL(2)=%NORM,RESUL(3)=%IDENT,%NOM="^[QUW]PRONUM(NOMG,%NORM,%IDENT)",LIM=$S($D(^[QUW]SCRC(SCR))=11:^[QUW]SCRC(SCR),1:0)-3 I $D(@%NOM)=10 D ^%VKMULNG G SUI
 S RS=@%NOM D ^%VKMULC
SUI F %I3=1:1:LIM S RESUL(%I3+3)=$S($D(%RS(%I3)):%RS(%I3),1:"")
 K %RS D CLEPAG^%VVIDEO,^%ABAFIGR,^%ABAFSCR K RESUL
QUES S ABENDSCR=0 D POCLEPA^%VVIDEO G FIN:%GO W $$L23^%QSLIB2("CTRLF pour accord") S DX=$X D ^%VLEC I CTRLA=1 S ABENDSCR=1 G END
 I (CTRLF=1)!(Y1="") D ^%ABGTPAR G END
 G QUES
END K %I3,%NOM,RS,LIM,CTRLA,CTRLE,CTRLF,CTRLR,CTRLZ Q
FIN D ^%ABGTPAR G END

