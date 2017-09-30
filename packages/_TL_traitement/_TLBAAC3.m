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

;%TLBAAC3^INT^1^59547,74028^0
%TLBAAC3 ;
 
 
BOUCLER 
 K @(TEMPO) S @TEMPO@(1)="ETIQ",@TEMPO@(2)="CONDSOR",@TEMPO@(3)="ECHGL"
 S @TEMPO@(4)="ARRET",@TEMPO@(5)="TETE"
 S @TEMPO@(6)="EXP",@TEMPO@(7)="POS",@TEMPO@(8)="PARTIE"
 S @TEMPO@(9)="TRBOUC"
 D EMPV^%ANGEPIL(TEMPO)
 
 I (MODAF'=0)&(MODEX'=3) D ADD^%TLIFEN("LOG","  "_$$^%QZCHW("repetition d'un sous-traitement"))
 S ETIQ=$$RED($$RED(ACTI,1),"TEXTE")
 S CONDSOR=$$RED(ACTI,2)
 I MODEX=3 S ECHEC=@GLOETD@(NIVEAU+1,"ECHEC.LOCAL"),PARTIE=@GLOETD@(NIVEAU+1,"PARTIE") G @PARTIE
 
 I '($$EXISTE(ETIQ)) S ECHEC=1 D:MODAF'=0 ADD^%TLIFEN("LOG","  * "_$$^%QZCHW("etiquette inconnue")_" : "_ETIQ) G FBOUC
 
 D:MODAF'=0 ADD^%TLIFEN("LOG","  * "_$$^%QZCHW("initialisation"))
 S ECHGL=3,TETE=ACTI,TRBOUC=1
BINIT 
 S ACTI=$$RED(TETE,ECHGL) I ACTI=0 G FBINIT
 D AFF^%TLIACT3 I ECHEC=1 G FBINIT
 S ECHGL=ECHGL+1 G BINIT
FBINIT 
 S ACTI=TETE I ECHEC=1 G FBOUC
 D:MODAF'=0 ADD^%TLIFEN("LOG","  * "_$$^%QZCHW("initialisation terminee"))
 S ARRET=0
 
BOUC 
PROLOGUE 
 S PARTIE="PROLOGUE"
 D EMPIL^%ANGEPIL("RETPR^%TLBAAC3")
 G ^%TLBADEB
RETPR 
 I ECHGL>0 S ECHEC=1
 
 I (ARRET=1)!(ABANDON!HALT) G FBOUC
 
CORPS 
 S PARTIE="CORPS"
 D EMPIL^%ANGEPIL("RETCPS^%TLBAAC3")
 G ^%TLBADEB
RETCPS 
 I ECHGL>0 S ECHEC=1
 
 I (ARRET=1)!(ABANDON!HALT) G FBOUC
 
EPILOGUE 
 S PARTIE="EPILOGUE"
 D EMPIL^%ANGEPIL("RETEP^%TLBAAC3")
 G ^%TLBADEB
RETEP 
 I ECHGL>0 S ECHEC=1
 
 I (ARRET=1)!(ABANDON!HALT) G FBOUC
 
 
 
 
 D:MODAF'=0 ADD^%TLIFEN("LOG"," * "_$$^%QZCHW("evaluation de la condition de sortie"))
 S EXP=$$SUBST^%ANARBR2(CONDSOR,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("evaluation impossible")) G FBOUC
 I EXP=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("condition fausse")) G BOUC
 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("condition vraie"))
FBOUC 
 I (MODAF'=0)&(('(ABANDON))&(HALT=0)) D ADD^%TLIFEN("LOG","  "_$$^%QZCHW("fin de la repetition")) I MODAF=2 D REAF^%TLBAIF(2)
 I ABANDON=2 S @GLOETD@(NIVEAU+1,"ECHEC.LOCAL")=ECHEC,@GLOETD@(NIVEAU+1,"PARTIE")=PARTIE
FREPET 
 G DEPIL^%ANGEPIL
 
 
ALLER 
 K @(TEMPO) S @TEMPO@(1)="ETIQ",@TEMPO@(2)="IN",@TEMPO@(3)="TETE"
 S @TEMPO@(4)="NO"
 D EMPV^%ANGEPIL(TEMPO)
 
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Saut a une adresse"))
 
 S ETIQ=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(ETIQ="") D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Adresse impossible a determiner")) S ECHEC=1 G FALLER
 
 S IN=""
BOUCAL 
 S IN=$O(@GLOSTO@(IN))
 I IN="" D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Adresse inconnue")) S ECHEC=1 G FALLER
 S TETE=@GLOSTO@(IN,"TETE"),NO=$$RED(TETE,1)
 I NO'=0 G BOUCAL
 S NO=$$RED(TETE,2)
 I $$RED(NO,"TEXTE")'="$ADRESSE" G BOUCAL
 S NO=$$RED($$RED(NO,1),"TEXTE")
 I NO'=ETIQ G BOUCAL
 
 S DEBRAN=IN
 
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin de saut a une adresse"))
FALLER 
 G DEPIL^%ANGEPIL
 
EXISTE(ETIQ) 
 N IG,IP,TETE,ACTI,COND,I,TYPE,TEXTE,GLOSTO
 S GLOSTO="^[QUI]TTL(TRT,2)"
 I ETIQ="" Q 0
 S IG=0
SGO0 S IG=IG+1
 I IG>$ZP(@GLOSTO@("")) Q 0
 S TETE=$S($D(@GLOSTO@(IG,"TETE")):@GLOSTO@(IG,"TETE"),1:"")
 I TETE="" D ERR
 S ACTI=$$RED(TETE,2)
 I $$RED(ACTI,"TYPE")'="ACTION" G SGO0
 I $$RED(ACTI,"TEXTE")'="$ETIQUETTE" G SGO0
 I $$RED($$RED(ACTI,1),"TEXTE")'=ETIQ G SGO0
 Q 1
ERR 
 I (MODAF'=0)&(MODEX'=3) D ADD^%TLIFEN("LOG","  "_$$^%QZCHW("la regle no")_" "_IG_" "_$$^%QZCHW("a ete mal analysee"))
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

