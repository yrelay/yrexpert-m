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

;%DLJIMP^INT^1^59547,73868^0
DLJIMP ;
 
 
 
 
 
 N SAVBELL,SCR,%V,DEJALU,PATOUCH,RESUL,%ABEND,CMS,ABENDSCR
 N %FT,%MD,%MF,VISU,VISUF,REFUSE
 S SAVBELL=$S($D(^TOZE($I,"BELL")):^TOZE($I,"BELL"),1:0)
 S SCR="DLJIMP"
 F %V=1:1:^%SCRE(SCR) S (DEJALU(%V),PATOUCH(%V),RESUL(%V))=""
GET D CLEPAG^%VVIDEO,^%VZCD0("IMPRESSION DES REGLES DE JALONNEMENT")
 S (%ABEND,CMS)=0
 D BEG^%VAFIGRI,^%VAFISCR,^%VMODISC
 G ASSEZ:ABENDSCR
 S %V=1
 F %U="%FT","%MD","%MF" S @%U=RESUL(%V),%V=%V+1
 D POCLEPA^%VVIDEO
 S VISU=$$^%VZECH2($$^%QZCHW("Impression "),"ECRAN","PAPIER")
 G:VISU="" ASSEZ
 S:VISU="ECRAN" ^TOZE($I,"BELL")=0
 S VISUF=VISU_"FA"
 D POCLEPA^%VVIDEO W "Tapez CTRLA pour abandonner..." H 1 D POCLEPA^%VVIDEO
 I VISU="PAPIER" D POCLEPA^%VVIDEO,BLK^%VVIDEO W "Impression en cours..." D NORM^%VVIDEO W *-1
 G SUITE
UCFT S REFUSE=0,CTRLF=0 Q:RESUL(IC)=""
 I '($D(^[QUI]DLJ(RESUL(IC)))) S REFUSE=1 Q
 Q
UCMD S REFUSE=0,CTRLF=0 Q
UCMF S REFUSE=0,CTRLF=0 Q
SUITE D:VISU="ECRAN" TETEC D:VISU="PAPIER" TETPA
 S FT=-1
 F %U=0:0 S FT=$N(^[QUI]DLJ(FT)) Q:(FT=-1)!%ABEND  D @VISUF S MD=-1 F %UU=0:0 S MD=$N(^[QUI]DLJ(FT,MD)) Q:(MD=-1)!%ABEND  S MF=-1 F %UUU=0:0 S MF=$N(^[QUI]DLJ(FT,MD,MF)) Q:(MF=-1)!%ABEND  S NF=-1 D BNF
 G FIN
 
BNF S NF=$N(^[QUI]DLJ(FT,MD,MF,NF))
 Q:(NF=-1)!%ABEND
 D STOP
 Q:%ABEND
 D TEST
 D STOP
 Q:%ABEND
 D:OK @VISU
 G BNF
 
TEST R *BIDON:0 G:BIDON=1 INTERU S OK=1
 I (%FT'="")&(FT'=%FT) S OK=0 Q
 I (%MD'="")&(MD'=%MD) S OK=0 Q
 I (%MF'="")&(MF'=%MF) S OK=0 Q
 Q
 
STOP U 0 R *BIDON:0 D TOUCHE^%INCCLAV(BIDON,.BIDON)
 G:BIDON=1 INTERU
 Q
 
TETEC D CLEPAG^%VVIDEO
 Q
 
TETPA S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR W #
 W "I M P R E S S I O N    D E S    R E G L E S    D  E    J A L O N N E M E N T",!,"============================================================================"
 W !,!
 W !,"LES REGLES QUI SUIVENT CORRESPONDENT AUX CRITERES SUIVANTS:",!,"  Famille technologique : ",$S(%FT="":"QUELCONQUE",1:%FT),!,"  Machine 1 : ",$S(%MD="":"QUELCONQUE",1:%MD),!,"  Machine 2 : ",$S(%MF="":"QUELCONQUE",1:%MF),!,!,!
 C IMPR Q
 
ECRAN N NUM
 S SCR="DLJ",NBC=^%SCRE(SCR),V=1
 F %U="FT","MD","MF","NF" S RESUL(V)=@%U,V=V+1
 S RESUL(5)=$P(^[QUI]DLJ(FT,MD,MF,NF),"^")
 D CLEPAG^%VVIDEO
 D AFGRI
 Q:%ABEND
 S NUM=""
BECOND S NUM=$O(^[QUI]DLJCOND(FT,MD,MF,NF,NUM))
 G:NUM="" ECFIN
 D ^%VZEAVT("Conditions")
 S SCR="DLJCOND"
 S RESUL(5)=NUM
 S CH=^[QUI]DLJCOND(FT,MD,MF,NF,NUM)
 F V=6:1:24 S RESUL(V)=$P(CH,"^",V-5)
 D AFGRI
 Q:%ABEND
 G BECOND
 
ECFIN D ^%VZEAVT("")
 Q
 
AFGRI 
 D STOP
 Q:%ABEND
 D BEG^%VAFIGRI
 D STOP
 Q:%ABEND
 D ^%VAFISCR
 D STOP
 Q:%ABEND
 D POCLEPA^%VVIDEO
 Q
 
PAPIER N CH,LI,NUM
 O IMPR
 S LI="--------------------------------------------------------------------------------"
 U IMPR W !,!,LI,!,"Jalon entre : ",MD,!,"         et : ",MF
 S NUM=""
BPACON S NUM=$O(^[QUI]DLJCOND(FT,MD,MF,NF,NUM))
 G:NUM="" PAPVAL
 S D=^[QUI]DLJCOND(FT,MD,MF,NF,NUM)
 F I=1:1:20 S CH(I)=$P(D,"^",I)
 F I=1,5,9,13,17 Q:CH(I)=""  W !,CH(I)," ",CH(I+1)," ",CH(I+2)," ",CH(I+3)
 G BPACON
PAPVAL U IMPR W !,"=> valeur jalon : ",$P(^[QUI]DLJ(FT,MD,MF,NF),"^")
 C IMPR
 Q
 
FIN S SCR="DLJIMP",%V=1 F %U="%FT","%MD","%MF" S RESUL(%V)=@%U,%V=%V+1
 G GET
ASSEZ K %FT,%MD,%MF,FT,MD,MF,NF,NBC
 S ^TOZE($I,"BELL")=SAVBELL
 D ECHON^%VVIDEO Q
INTERU C:$D(IMPR) IMPR
 U 0 D ^%VZEAVT("Abandon...")
 S %ABEND=1,OK=0 Q
 
PAPIERFA N CH,LI
 Q:(%FT'="")&(FT'=%FT)
 O IMPR
 S LI="--------------------------------------------------------------------------------"
 U IMPR W !,!,LI,!,LI,!,$$^%QZCHW("FAMILLE TECHNOLOGIQUE")_" : ",FT
 U IMPR W !,$$^%QZCHW("La valeur courante du jalon par defaut est ")_$S($D(^[QUI]PLJALDEF(FT)):$P(^[QUI]PLJALDEF(FT),"^")_" "_$$^%QZCHW("jour(s)"),1:$$^%QZCHW("INCONNUE")),!,!
 Q
ECRANFA Q:(%FT'="")&(FT'=%FT)
 D CLEPAG^%VVIDEO
 S DX=10,DY=10 X XY W $$^%QZCHW("FAMILLE TECHNOLOGIQUE")_" : "_FT
 W !,!
 S DX=10,DY=12 X XY W $$^%QZCHW("La valeur courante du jalon par defaut est ")_$S($D(^[QUI]PLJALDEF(FT)):$P(^[QUI]PLJALDEF(FT),"^")_" "_$$^%QZCHW("jour(s)"),1:$$^%QZCHW("INCONNUE"))
 D ^%VZEAVT("")
 Q
 ;
 ;

