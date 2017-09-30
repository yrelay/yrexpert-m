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

;%QSTSAUT^INT^1^59547,73883^0
%QSTSAUT(TEST) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N MODELE,IMPR,ADRES,NOMTEST
 
 D CLEPAG^%VVIDEO
 I '($D(^[QUI]QUERYV("POINT"))) D ^%VZEAVT($$^%QZCHW("autotest impossible : vous n'avez pas les donnees necessaires a l'autotest")) Q
 I '($$EXISTE^%TLINTER(TEST)) D ^%VZEAVT($$^%QZCHW("autotest impossible : vous n'avez pas le traitement necessaire a l'autotest: ")_TEST) Q
 S MODELE=$$MODEL^%QSMODEL
 W !,$$^%QZCHW("installation du schema de donnees de l'autotest")
 D QSMODEL^%QSMODEL(1,"GEOMETRIE",QUI,WHOIS)
 D ^%QSGES11("POINT","AUTOTEST","GDX",0,"","")
 D STOCK^%QSGES11("AUTOTEST","P0001")
 D CLEPAG^%VVIDEO W !,$$^%QZCHW("lancement de l'autotest"),!
 S ZINZIN=$$ACTIVL^%TLIACTI(TEST,"AUTOTEST",0,0)
 D DEL^%QSGES11("AUTOTEST")
 W !,$$^%QZCHW("autotest termine")
 I MODELE'="" W !,$$^%QZCHW("installation du schema de donnees habituel") D QSMODEL^%QSMODEL(1,MODELE,QUI,WHOIS)
RESUL 
 Q:$$^%VZECH2("impression des resultats"_" ","oui","non")'="oui"
 D POCLEPA^%VVIDEO
 S SORTIE=$$^%VZECH2("sur","imprimante","ecran")
 Q:SORTIE=1
 S:SORTIE=6 SORTIE="imprimante"
 S ADRES=$$ADRESSE^%QSTSTEC
 S NOMTEST=$O(@ADRES@(""))
 I SORTIE="imprimante" S IMPR=$$TABID^%INCOIN("PRINTER") O IMPR U IMPR
 W $$^%QZCHW("resultats de l'autotest"),!
 F %N=0:1 Q:NOMTEST=""  D IMPRIME S NOMTEST=$O(@ADRES@(NOMTEST))
 I SORTIE="imprimante" W # C IMPR
 Q
IMPRIME 
 W !,!,$$^%QZCHW("test")_" : "_NOMTEST
 W !,"   "_$$^%QZCHW("date")_" : "_@ADRES@(NOMTEST,"DATE")
 W !,"   "_$$^%QZCHW("resultat theorique")_" : "_@ADRES@(NOMTEST,"CARDINAL.THEORIQUE")
 W !,"   "_$$^%QZCHW("resultat reel")_" : "_@ADRES@(NOMTEST,"CARDINAL.REEL")
 W !,"   "_$$^%QZCHW("marge d'erreur")_" : "_@ADRES@(NOMTEST,"ECART")
 W !,"   "_$$^%QZCHW("test OK")_" : "_@ADRES@(NOMTEST,"OK")
 Q

